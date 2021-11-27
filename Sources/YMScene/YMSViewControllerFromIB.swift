//
//  YMSViewControllerFromIB.swift
//  YMScene
//
//  Created by Yakov Manshin on 5/11/20.
//  Copyright © 2020 Yakov Manshin. All rights reserved.
//

#if canImport(UIKit)

// MARK: - Requirements

/// A protocol which enables the scene to be initialized when its view controllers is instantiated from a storyboard.
public protocol YMSViewControllerFromIB: YMSViewController {
    
    /// Use this method to configure scenes instantiated from a NIB or storyboard.
    ///
    /// - Parameter input: *Required.* The input used for configuring the scene.
    func instantiateScene(with input: SceneInput)
    
}

// MARK: - Default Implementation

extension YMSViewControllerFromIB {
    
    public func instantiateScene(with input: SceneInput) {
        _ = YMScene(with: input, viewController: self)
    }
    
}

#endif
