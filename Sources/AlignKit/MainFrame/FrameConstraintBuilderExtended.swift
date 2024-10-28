//
//  FrameMakerExtendable.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 17/10/24.
//

import UIKit


public class FrameConstraintBuilderExtended: RelationalFrameConstraintBuilder, FrameAnchorable {
    
    public typealias AnchorType = FrameConstraintBuilderExtended
    
    public var top: AnchorType {
        storeAnchor(.top)
        return self
    }
    
    public var bottom: AnchorType {
        storeAnchor(.bottom)
        return self
    }
    
    public var left: AnchorType {
        storeAnchor(.left)
        return self
    }
    
    public var right: AnchorType {
        storeAnchor(.right)
        return self
    }
    
    public var leading: AnchorType {
        storeAnchor(.leading)
        return self
    }
    
    public var trailing: AnchorType {
        storeAnchor(.trailing)
        return self
    }
    
    public var topMargin: AnchorType {
        storeAnchor(.topMargin)
        return self
    }
    
    public var bottomMargin: AnchorType {
        storeAnchor(.bottomMargin)
        return self
    }
    
    public var leftMargin: AnchorType {
        storeAnchor(.leftMargin)
        return self
    }
    
    public var rightMargin: AnchorType {
        storeAnchor(.rightMargin)
        return self
    }
    
    public var margins: AnchorType {
        storeAnchor(.margins)
        return self
    }
    
    public var leadingMargin: AnchorType {
        storeAnchor(.leadingMargin)
        return self
    }
    
    public var trailingMargin: AnchorType {
        storeAnchor(.trailingMargin)
        return self
    }
    
    public var width: AnchorType {
        storeAnchor(.width)
        return self
    }
    
    public var height: AnchorType {
        storeAnchor(.height)
        return self
    }
    
    public var lastBaseline: AnchorType {
        storeAnchor(.lastBaseline)
        return self
    }
    
    public var firstBaseline: AnchorType {
        storeAnchor(.firstBaseline)
        return self
    }
    
    public var edges: AnchorType {
        storeAnchor(.edges)
        return self
    }
    
    public var centre: AnchorType {
        storeAnchor(.centre)
        return self
    }
    
    public var centreWithInMargins: AnchorType {
        storeAnchor(.centreWithInMargins)
        return self
    }
    
    public var size: AnchorType {
        storeAnchor(.size)
        return self
    }
    
    public var centreY: AnchorType {
        storeAnchor(.centerY)
        return self
    }
    
    public var centreX: AnchorType {
        storeAnchor(.centerX)
        return self
    }
    
    public var centerXWithInMargin: AnchorType {
        storeAnchor(.centerXWithInMargin)
        return self
    }
    
    public var centerYWithInMargin: AnchorType {
        storeAnchor(.centerYWithInMargin)
        return self
    }
    
    private func storeAnchor(_ anchor: FrameLayoutAttribute) {
        self.frameDescription.layoutAttribute += anchor
    }
    
}
