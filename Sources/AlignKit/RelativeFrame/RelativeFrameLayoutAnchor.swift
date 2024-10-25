//
//  FrameLayoutAnchor.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 14/10/24.
//

import UIKit


protocol RelativeFrameLayoutAnchor {
    
}

extension RelativeFrameLayoutAnchor {
    
    var extractYAxisAnchor: NSLayoutYAxisAnchor? {
        return (self as? NSLayoutYAxisAnchor)
    }
    
    var extractXAxisAnchor: NSLayoutXAxisAnchor? {
        return (self as? NSLayoutXAxisAnchor)
    }
    
    var extractDimension: NSLayoutDimension? {
        return (self as? NSLayoutDimension)
    }
    
}

extension NSLayoutXAxisAnchor: RelativeFrameLayoutAnchor {
    
}

extension NSLayoutYAxisAnchor: RelativeFrameLayoutAnchor {
    
}

extension NSLayoutDimension: RelativeFrameLayoutAnchor {
    
}
