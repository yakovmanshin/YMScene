//
//  YMSDTOProtocol.swift
//  YMScene
//
//  Created by Yakov Manshin on 5/11/20.
//  Copyright © 2020 Yakov Manshin. All rights reserved.
//

#if canImport(UIKit)

// MARK: - DTO Protocol

/// A protocol that describes *data transfer objects* (DTOs) used to pass data in VIP cycles.
public protocol YMSDTOProtocol {
    
    // MARK: Associated Types
    
    associatedtype Input
    
}

#endif
