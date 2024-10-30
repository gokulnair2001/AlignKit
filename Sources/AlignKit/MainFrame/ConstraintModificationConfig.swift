//
//  ConstraintModificationConfig.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 29/10/24.
//

import UIKit


/// `ConstraintModificationConfig` is a configuration class used to manage the settings related
/// to the modification of constraints in the layout framework.
///
/// This class provides options to control whether constraints should be generated, animated,
/// and whether debugging information should be printed to the console.
internal class ConstraintModificationConfig {
    
    /// A Boolean value indicating whether constraints should be generated.
    /// Defaults to `true`.
    var shouldGenerateConstraints: Bool = true
    
    /// A Boolean value indicating whether constraints should be animated.
    /// Defaults to `false`.
    var shouldAnimate: Bool = false
    
    /// The duration of the animation if `shouldAnimate` is set to `true`.
    /// Defaults to `0`, indicating no animation.
    var duration: TimeInterval = 0
    
    /// A Boolean value indicating whether to print debug information to the console.
    /// Defaults to `false`.
    var shouldDebugOnConsole: Bool = false
    
    /// A string prefix used for debugging output to help identify log messages.
    var debugPrefix: String = ""
}
