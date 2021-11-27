//
//  YMSViewController.swift
//  YMScene
//
//  Created by Yakov Manshin on 5/11/20.
//  Copyright © 2020 Yakov Manshin. All rights reserved.
//

#if canImport(UIKit)

import UIKit

/// A protocol that describes the scene's view controller.
public protocol YMSViewController: UIViewController {
    
    associatedtype Interactor: YMSInteractor
    associatedtype SceneInput
    
    /// The reference to the scene's interactor.
    var interactor: Interactor! { get set }
    
    init()
    
    func configureScene(with input: SceneInput)
    
}

#endif
