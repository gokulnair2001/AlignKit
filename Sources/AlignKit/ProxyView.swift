//
//  ProxyView.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 14/10/24.
//


import UIKit
 

/// A protocol that defines a type that acts as a proxy for a UIView.
///
/// The `ProxyView` protocol is designed to provide an interface for accessing a single UIView instance
/// from a conforming type. This allows for better abstraction and flexibility when managing or
/// manipulating views in a layout system.
///
/// Conforming types must provide a `view` property that returns the associated UIView.
internal protocol ProxyView {
    
    /// The UIView instance that this proxy represents.
    var view: UIView { get }
}

