//
//  FrameModifierType.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 19/11/24.
//

import Foundation


/// Represents different types of frame modifiers that can be applied to layout constraints.
enum FrameModifierType {
    /// Adjusts the frame by adding padding (insets) inside the edges.
    case inset
    
    /// Adjusts the frame by adding an offset relative to another element.
    case offset
    
    /// Scales the frame by multiplying its size or position by a factor.
    case multiplier
    
    /// Scales the frame by dividing its size or position by a factor.
    case divider
}
