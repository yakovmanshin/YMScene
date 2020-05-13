//
//  YMSInteractorProtocol.swift
//  YMScene
//
//  Created by Yakov Manshin on 5/11/20.
//  Copyright © 2020 Yakov Manshin. All rights reserved.
//

#if canImport(UIKit)

// MARK: - Interactor Protocol

public protocol YMSInteractorProtocol: AnyObject {
    
    // MARK: Associated Types
    
    associatedtype DTO: YMSDTOProtocol
    
    associatedtype Presenter: YMSPresenterProtocol
    
    // MARK: Properties
    
    /// The instance of the scene's presenter.
    var presenter: Presenter { get }
    
    // MARK: Initializers
    
    init(with presenter: Presenter)
    
    // MARK: Optional Methods
    
    /// Initializes the scene with the provided input, and prepares it for display.
    ///
    /// - Parameter input: *Required.* The input provided by the object instantiating the scene.
    func initializeScene(with input: DTO.Input)
    
}

#endif
