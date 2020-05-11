//
//  YMScene.swift
//  YMScene
//
//  Created by Yakov Manshin on 5/11/20.
//  Copyright © 2020 Yakov Manshin. All rights reserved.
//

#if canImport(UIKit)

import UIKit

// MARK: - YMScene Core

/// The base class scenes inherit from.
class YMScene<
    DTO,
    Interactor,
    Presenter: YMSPresenterProtocol,
    ViewController
> where
    Interactor.DTO == DTO,
    Interactor.Presenter == Presenter,
    Presenter.ViewController == ViewController,
    ViewController.Interactor == Interactor
{
    
    // MARK: Properties
    
    final let interactor: Interactor
    final let viewController: ViewController
    
    // MARK: Initializers
    
    /// Automatically initializes scene components of types specified in class declaration.
    ///
    /// - Parameter viewController: *Optional.* The view controller to use in the scene, if one is already instantiated.
    private init(viewController: ViewController?) {
        let viewController = Self.getResolvedViewController(viewController)
        let presenter = Presenter(with: viewController)
        let interactor = Interactor(with: presenter)
        
        viewController.setInteractorIfNeeded(interactor)
        
        self.interactor = interactor
        self.viewController = viewController
    }
    
    /// Initializes the scene with the provided input.
    ///
    /// - Parameter input: *Required.* The input provided by the object instantiating the scene.
    /// - Parameter viewController: *Optional.* The view controller to use in the scene, if one is already instantiated. Default is `nil`.
    convenience init(with input: DTO.Input, viewController: ViewController? = nil) {
        self.init(viewController: viewController)
        
        interactor.initializeScene(using: input)
    }
    
    /// Checks whether the passed view controller exists, and returns either the passed view controller or a new view controller instance.
    ///
    /// - Parameter viewController: *Optional.* The optional view controller  input.
    private static func getResolvedViewController(_ viewController: ViewController?) -> ViewController {
        let resolvedViewController: ViewController
        if let viewController = viewController {
            resolvedViewController = viewController
        } else {
            resolvedViewController = ViewController()
        }
        
        return resolvedViewController
    }
    
}

#endif
