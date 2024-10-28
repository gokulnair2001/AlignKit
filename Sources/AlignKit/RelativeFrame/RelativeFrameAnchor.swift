//
//  RelativeFrameAnchor.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 10/10/24.
//


import UIKit


public class RelativeFrameAnchor: FrameAnchorable {
    
    var view: UIView
    
    private let relativeAnchorManager: RelativeFrameAnchorManager
    
    init(view: UIView) {
        self.view = view
        self.relativeAnchorManager = RelativeFrameAnchorManager(view: view)
    }
    
    public typealias AnchorType = [RelativeFrameLayoutAnchor]
    
    public var top: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.top)
    }
    
    public var bottom: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.bottom)
    }
    
    public var left: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.left)
    }
    
    public var right: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.right)
    }
    
    public var leading: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.leading)
    }
    
    public var trailing: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.trailing)
    }
    
    public var topMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.topMargin)
    }
    
    public var bottomMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.bottomMargin)
    }
    
    public var leftMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.top)
    }
    
    public var rightMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.rightMargin)
    }
    
    public var margins: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.margins)
    }
    
    public var leadingMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.leadingMargin)
    }
    
    public var trailingMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.trailingMargin)
    }
    
    public var width: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.width)
    }
    
    public var height: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.height)
    }
    
    public var lastBaseline: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.lastBaseline)
    }
    
    public var firstBaseline: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.firstBaseline)
    }
    
    public var edges: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.edges)
    }
    
    public var centre: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centre)
    }
    
    public var centreWithInMargins: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centreWithInMargins)
    }
    
    public var size: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.size)
    }
    
    public var centreY: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centerY)
    }
    
    public var centreX: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centerX)
    }
    
    public var centerXWithInMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centerXWithInMargin)
    }
    
    public var centerYWithInMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centerYWithInMargin)
    }
    
}

