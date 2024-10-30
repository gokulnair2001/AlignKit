//
//  FrameMakerExtendable.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 17/10/24.
//

import UIKit


/// `FrameConstraintBuilderExtended` extends the functionality of `RelationalFrameConstraintBuilder`
/// to support secondary chaining of constraints. It provides additional layout anchors for more
/// flexible constraint building.
public class FrameConstraintBuilderExtended: RelationalFrameConstraintBuilder, FrameAnchorable {
    
    /// A typealias for `FrameConstraintBuilderExtended` to simplify access to anchor types.
    public typealias AnchorType = FrameConstraintBuilderExtended
    
    // MARK: - Anchor Properties
    
    /// The top anchor of the frame.
    public var top: AnchorType {
        storeAnchor(.top)
        return self
    }
    
    /// The bottom anchor of the frame.
    public var bottom: AnchorType {
        storeAnchor(.bottom)
        return self
    }
    
    /// The left anchor of the frame.
    public var left: AnchorType {
        storeAnchor(.left)
        return self
    }
    
    /// The right anchor of the frame.
    public var right: AnchorType {
        storeAnchor(.right)
        return self
    }
    
    /// The leading anchor of the frame.
    public var leading: AnchorType {
        storeAnchor(.leading)
        return self
    }
    
    /// The trailing anchor of the frame.
    public var trailing: AnchorType {
        storeAnchor(.trailing)
        return self
    }
    
    /// The top margin anchor of the frame.
    public var topMargin: AnchorType {
        storeAnchor(.topMargin)
        return self
    }
    
    /// The bottom margin anchor of the frame.
    public var bottomMargin: AnchorType {
        storeAnchor(.bottomMargin)
        return self
    }
    
    /// The left margin anchor of the frame.
    public var leftMargin: AnchorType {
        storeAnchor(.leftMargin)
        return self
    }
    
    /// The right margin anchor of the frame.
    public var rightMargin: AnchorType {
        storeAnchor(.rightMargin)
        return self
    }
    
    /// The margin anchors of the frame.
    public var margins: AnchorType {
        storeAnchor(.margins)
        return self
    }
    
    /// The leading margin anchor of the frame.
    public var leadingMargin: AnchorType {
        storeAnchor(.leadingMargin)
        return self
    }
    
    /// The trailing margin anchor of the frame.
    public var trailingMargin: AnchorType {
        storeAnchor(.trailingMargin)
        return self
    }
    
    /// The width anchor of the frame.
    public var width: AnchorType {
        storeAnchor(.width)
        return self
    }
    
    /// The height anchor of the frame.
    public var height: AnchorType {
        storeAnchor(.height)
        return self
    }
    
    /// The last baseline anchor of the frame.
    public var lastBaseline: AnchorType {
        storeAnchor(.lastBaseline)
        return self
    }
    
    /// The first baseline anchor of the frame.
    public var firstBaseline: AnchorType {
        storeAnchor(.firstBaseline)
        return self
    }
    
    /// The edges of the frame.
    public var edges: AnchorType {
        storeAnchor(.edges)
        return self
    }
    
    /// The center anchors of the frame.
    public var centre: AnchorType {
        storeAnchor(.centre)
        return self
    }
    
    /// The center anchors within margins of the frame.
    public var centreWithInMargins: AnchorType {
        storeAnchor(.centreWithInMargins)
        return self
    }
    
    /// The size anchors of the frame.
    public var size: AnchorType {
        storeAnchor(.size)
        return self
    }
    
    /// The center Y anchor of the frame.
    public var centreY: AnchorType {
        storeAnchor(.centerY)
        return self
    }
    
    /// The center X anchor of the frame.
    public var centreX: AnchorType {
        storeAnchor(.centerX)
        return self
    }
    
    /// The center X anchor within margins of the frame.
    public var centerXWithInMargin: AnchorType {
        storeAnchor(.centerXWithInMargin)
        return self
    }
    
    /// The center Y anchor within margins of the frame.
    public var centerYWithInMargin: AnchorType {
        storeAnchor(.centerYWithInMargin)
        return self
    }
    
    // MARK: - Private Methods
    
    /// Stores the given anchor in the frame description's layout attributes.
    /// - Parameter anchor: The `FrameLayoutAttribute` to store.
    private func storeAnchor(_ anchor: FrameLayoutAttribute) {
        self.frameDescription.layoutAttribute += anchor
    }
}
