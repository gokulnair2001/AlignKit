//
//  View+Extension.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//

import UIKit


/// Extension providing convenience properties for `FrameConstraintView` to facilitate
/// constraint-based layout configurations.
///
/// This extension adds properties to the `FrameConstraintView` that enable easy
/// access to layout configuration methods and anchor points for constraints.
extension FrameConstraintView {
    
    /// A convenience property that returns a `FrameConstraintComposer` for the view.
    ///
    /// This property sets `translatesAutoresizingMaskIntoConstraints` to `false`,
    /// allowing for the use of Auto Layout constraints without automatic adjustments
    /// from the autoresizing mask. It returns an instance of `FrameConstraintComposer`,
    /// which can be used to define and manage layout constraints for the view.
    ///
    /// Example usage:
    /// ```swift
    /// view.alk.top.equalToSuperview().offset(20)
    /// ```
    public var alk: FrameConstraintComposer {
        self.translatesAutoresizingMaskIntoConstraints = false
        return FrameConstraintComposer(view: self)
    }
    
    /// A convenience property that provides access to a `RelativeFrameAnchor` for the view.
    ///
    /// This property allows users to obtain an instance of `RelativeFrameAnchor`, enabling
    /// the use of relative anchoring methods for constraint creation. It helps streamline
    /// the process of creating constraints relative to other views or layout guides.
    ///
    /// Example usage:
    /// ```swift
    /// view.anchor.top.equalToSuperview().offset(10)
    /// ```
    public var anchor: RelativeFrameAnchor {
        return RelativeFrameAnchor(view: self)
    }

}

