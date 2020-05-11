//
//  YMSViewControllerProtocol.swift
//  YMScene
//
//  Created by Yakov Manshin on 5/11/20.
//  Copyright © 2020 Yakov Manshin. All rights reserved.
//

#if canImport(UIKit)

import UIKit

// MARK: - View Controller Protocol

public protocol YMSViewControllerProtocol: UIViewController {
    
    // MARK: Associated Types
    
    associatedtype Interactor: YMSInteractorProtocol
    
    // MARK: Properties
    
    /// The reference to the scene's interactor.
    var interactor: Interactor! { get set }
    
    // MARK: Initializers
    
    init()
    
    // MARK: Optional Methods
    
    /// Checks whether `interactor` exists on the view controller, and if not, sets it.
    ///
    /// - Parameter interactor: *Required.* The interactor to set.
    func setInteractorIfNeeded(_ interactor: Interactor)
    
}

// MARK: - Default Implementation

public extension YMSViewControllerProtocol {
    
    func setInteractorIfNeeded(_ interactor: Interactor) {
        if self.interactor == nil {
            self.interactor = interactor
        }
    }
    
}

#endif
