//
//  FrameMakerExtendable.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 17/10/24.
//

import UIKit


class FrameConstraintBuilderExtended: RelationalFrameConstraintBuilder, FrameAnchorable {
    
    typealias AnchorType = FrameConstraintBuilderExtended
    
    var top: AnchorType {
        storeAnchor(.top)
        return self
    }
    
    var bottom: AnchorType {
        storeAnchor(.bottom)
        return self
    }
    
    var left: AnchorType {
        storeAnchor(.left)
        return self
    }
    
    var right: AnchorType {
        storeAnchor(.right)
        return self
    }
    
    var leading: AnchorType {
        storeAnchor(.leading)
        return self
    }
    
    var trailing: AnchorType {
        storeAnchor(.trailing)
        return self
    }
    
    var topMargin: AnchorType {
        storeAnchor(.topMargin)
        return self
    }
    
    var bottomMargin: AnchorType {
        storeAnchor(.bottomMargin)
        return self
    }
    
    var leftMargin: AnchorType {
        storeAnchor(.leftMargin)
        return self
    }
    
    var rightMargin: AnchorType {
        storeAnchor(.rightMargin)
        return self
    }
    
    var margins: AnchorType {
        storeAnchor(.margins)
        return self
    }
    
    var leadingMargin: AnchorType {
        storeAnchor(.leadingMargin)
        return self
    }
    
    var trailingMargin: AnchorType {
        storeAnchor(.trailingMargin)
        return self
    }
    
    var width: AnchorType {
        storeAnchor(.width)
        return self
    }
    
    var height: AnchorType {
        storeAnchor(.height)
        return self
    }
    
    var lastBaseline: AnchorType {
        storeAnchor(.lastBaseline)
        return self
    }
    
    var firstBaseline: AnchorType {
        storeAnchor(.firstBaseline)
        return self
    }
    
    var edges: AnchorType {
        storeAnchor(.edges)
        return self
    }
    
    var centre: AnchorType {
        storeAnchor(.centre)
        return self
    }
    
    var centreWithInMargins: AnchorType {
        storeAnchor(.centreWithInMargins)
        return self
    }
    
    var size: AnchorType {
        storeAnchor(.size)
        return self
    }
    
    var centreY: AnchorType {
        storeAnchor(.centerY)
        return self
    }
    
    var centreX: AnchorType {
        storeAnchor(.centerX)
        return self
    }
    
    var centerXWithInMargin: AnchorType {
        storeAnchor(.centerXWithInMargin)
        return self
    }
    
    var centerYWithInMargin: AnchorType {
        storeAnchor(.centerYWithInMargin)
        return self
    }
    
    private func storeAnchor(_ anchor: FrameLayoutAttribute) {
        self.frameDescription.layoutAttribute += anchor
    }
    
}
