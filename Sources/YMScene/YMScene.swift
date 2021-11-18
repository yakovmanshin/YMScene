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
open class YMScene<
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
    
    final public let interactor: Interactor
    final public let viewController: ViewController
    
    // MARK: Initializers
    
    /// Initializes the scene with the provided input.
    ///
    /// - Parameter input: *Required.* The input provided by the object instantiating the scene.
    /// - Parameter viewController: *Optional.* The view controller to use in the scene, if one is already instantiated. Default is `nil`.
    public init(with input: DTO.Input, viewController: ViewController? = nil) {
        let sceneComponents = Self.makeRequiredComponents(viewController: viewController)
        
        self.interactor = sceneComponents.interactor
        self.viewController = sceneComponents.viewController
        
        interactor.configureScene(with: input)
    }
    
    /// Initializes required scene components.
    ///
    /// - Parameter viewController: *Required.* The view controller if one is already instantiated; otherwise, pass `nil`.
    ///
    /// - Returns: `RequiredComponents`. The required components of the newly-created scene.
    private static func makeRequiredComponents(viewController: ViewController?) -> RequiredComponents {
        let viewController = Self.getResolvedViewController(viewController)
        let presenter = Presenter(with: viewController)
        let interactor = Interactor(with: presenter)
        
        viewController.setInteractorIfNeeded(interactor)
        
        if #available(iOS 9, *) {
            viewController.loadViewIfNeeded()
        } else {
            _ = viewController.view
        }
        
        return RequiredComponents(interactor: interactor, viewController: viewController)
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

// MARK: - Supplemental Models

private extension YMScene {
    
    /// The object that holds the required components of a scene.
    struct RequiredComponents {
        let interactor: Interactor
        let viewController: ViewController
    }
    
}

#endif
