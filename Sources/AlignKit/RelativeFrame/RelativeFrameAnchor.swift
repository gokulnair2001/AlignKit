//
//  RelativeFrameAnchor.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 10/10/24.
//


import UIKit


class RelativeFrameAnchor: FrameAnchorable {
    
    var view: UIView
    
    private let relativeAnchorManager: RelativeFrameAnchorManager
    
    init(view: UIView) {
        self.view = view
        self.relativeAnchorManager = RelativeFrameAnchorManager(view: view)
    }
    
    typealias AnchorType = [RelativeFrameLayoutAnchor]
    
    var top: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.top)
    }
    
    var bottom: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.bottom)
    }
    
    var left: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.left)
    }
    
    var right: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.right)
    }
    
    var leading: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.leading)
    }
    
    var trailing: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.trailing)
    }
    
    var topMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.topMargin)
    }
    
    var bottomMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.bottomMargin)
    }
    
    var leftMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.top)
    }
    
    var rightMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.rightMargin)
    }
    
    var margins: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.margins)
    }
    
    var leadingMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.leadingMargin)
    }
    
    var trailingMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.trailingMargin)
    }
    
    var width: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.width)
    }
    
    var height: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.height)
    }
    
    var lastBaseline: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.lastBaseline)
    }
    
    var firstBaseline: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.firstBaseline)
    }
    
    var edges: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.edges)
    }
    
    var centre: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centre)
    }
    
    var centreWithInMargins: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centreWithInMargins)
    }
    
    var size: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.size)
    }
    
    var centreY: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centerY)
    }
    
    var centreX: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centerX)
    }
    
    var centerXWithInMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centerXWithInMargin)
    }
    
    var centerYWithInMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centerYWithInMargin)
    }
    
}

