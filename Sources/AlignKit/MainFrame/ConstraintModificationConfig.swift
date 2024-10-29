//
//  ConstraintModificationConfig.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 29/10/24.
//

import UIKit


internal class ConstraintModificationConfig {
    
    var shouldGenerateConstraints: Bool = true
    
    var shouldAnimate: Bool = false
    var duration: TimeInterval = 0
    
    var shouldDebugOnConsole: Bool = false
    var debugPrefix: String = ""
}
