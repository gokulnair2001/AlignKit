//
//  View+Extension.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//

import UIKit


typealias FrameConstraintView = UIView

extension FrameConstraintView {
    
    var alk: FrameConstraintComposer {
        self.translatesAutoresizingMaskIntoConstraints = false
        return FrameConstraintComposer(view: self)
    }
    
    var anchor: RelativeFrameAnchor {
        return RelativeFrameAnchor(view: self)
    }

}

