//
//  YMSViewControllerIBInitializable.swift
//  YMScene
//
//  Created by Yakov Manshin on 5/11/20.
//  Copyright © 2020 Yakov Manshin. All rights reserved.
//

#if canImport(UIKit)

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
