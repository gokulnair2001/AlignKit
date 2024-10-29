//
//  View+Extension.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//

import UIKit


extension FrameConstraintView {
    
    public var alk: FrameConstraintComposer {
        self.translatesAutoresizingMaskIntoConstraints = false
        return FrameConstraintComposer(view: self)
    }
    
    public var anchor: RelativeFrameAnchor {
        return RelativeFrameAnchor(view: self)
    }

}

