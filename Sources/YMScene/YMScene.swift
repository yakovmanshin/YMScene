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
    Input,
    Interactor,
    ViewController: YMSViewController
> where
    ViewController.SceneInput == Input,
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
    public init(with input: Input, viewController: ViewController? = nil) {
        let components = Self.makeSceneComponents(viewController: viewController)
        
        self.interactor = components.interactor
        self.viewController = components.viewController
        
        prepareView()
        
        self.viewController.configureScene(with: input)
    }
    
    /// Initializes required scene components.
    ///
    /// - Parameter viewController: *Required.* The view controller if one is already instantiated; otherwise, pass `nil`.
    ///
    /// - Returns: `Components`. The required components of the newly-created scene.
    private static func makeSceneComponents(viewController: ViewController?) -> Components {
        let interactor = Interactor()
        let viewController = viewController ?? ViewController()
        viewController.interactor = interactor
        
        return Components(interactor: interactor, viewController: viewController)
    }
    
    private func prepareView() {
        viewController.loadViewIfNeeded()
    }
    
}

// MARK: - Supplemental Models

extension YMScene {
    
    /// The object that holds the required components of a scene.
    private struct Components {
        let interactor: Interactor
        let viewController: ViewController
    }
    
}

#endif
