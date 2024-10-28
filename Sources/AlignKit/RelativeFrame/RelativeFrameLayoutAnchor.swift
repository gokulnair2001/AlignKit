//
//  FrameLayoutAnchor.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 14/10/24.
//

import UIKit


public protocol RelativeFrameLayoutAnchor {
    
}

extension RelativeFrameLayoutAnchor {
    
    internal var extractYAxisAnchor: NSLayoutYAxisAnchor? {
        return (self as? NSLayoutYAxisAnchor)
    }
    
    internal var extractXAxisAnchor: NSLayoutXAxisAnchor? {
        return (self as? NSLayoutXAxisAnchor)
    }
    
    internal var extractDimension: NSLayoutDimension? {
        return (self as? NSLayoutDimension)
    }
    
}

extension NSLayoutXAxisAnchor: RelativeFrameLayoutAnchor {
    
}

extension NSLayoutYAxisAnchor: RelativeFrameLayoutAnchor {
    
}

extension NSLayoutDimension: RelativeFrameLayoutAnchor {
    
}
