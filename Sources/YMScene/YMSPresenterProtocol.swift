//
//  YMSPresenterProtocol.swift
//  YMScene
//
//  Created by Yakov Manshin on 5/11/20.
//  Copyright © 2020 Yakov Manshin. All rights reserved.
//

#if canImport(UIKit)

import UIKit

// MARK: - Presenter Protocol

protocol YMSPresenterProtocol {
    
    // MARK: Associated Types
    
    associatedtype ViewController: YMSViewControllerProtocol
    
    // MARK: Properties
    
    /// The reference to the scene's view controller.
    ///
    /// - Important: This property must be `weak`.
    var viewController: ViewController! { get }
    
    // MARK: Initializers
    
    init(with viewController: ViewController)
    
}

#endif
