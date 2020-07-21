//
//  YMSViewControllerIBInitializable.swift
//  YMScene
//
//  Created by Yakov Manshin on 5/11/20.
//  Copyright © 2020 Yakov Manshin. All rights reserved.
//

#if canImport(UIKit)

/// A protocol which enables the scene to be initialized when its view controllers is instantiated from a storyboard.
///
/// - Important: `configureScene(with:)` must be called in `viewDidLoad()`.
public protocol YMSViewControllerIBInitializable: YMSViewControllerProtocol {
    
    // MARK: Associated Types
    
    associatedtype DTO: YMSDTOProtocol
    
    // MARK: Scene Configuration
    
    /// Use this method to configure scenes instantiated from a NIB or storyboard.
    ///
    /// - Parameter input: *Required.* The input used for configuring the scene.
    func configureScene(with input: DTO.Input)
    
}

#endif
