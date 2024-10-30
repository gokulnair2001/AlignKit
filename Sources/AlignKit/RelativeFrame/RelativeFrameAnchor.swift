//
//  RelativeFrameAnchor.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 10/10/24.
//


import UIKit


/// `RelativeFrameAnchor` is a class that provides layout anchors relative to a specified UIView.
/// It uses a `RelativeFrameAnchorManager` to manage the retrieval of various layout anchors
/// such as top, bottom, leading, trailing, and margins.
public class RelativeFrameAnchor: FrameAnchorable {
    
    /// The UIView associated with this anchor.
    var view: UIView
    
    /// The manager responsible for handling relative anchors for the specified view.
    private let relativeAnchorManager: RelativeFrameAnchorManager
    
    /// Initialises a new instance of `RelativeFrameAnchor` with a specified view.
    /// - Parameter view: The UIView to which the anchors will be relative.
    init(view: UIView) {
        self.view = view
        self.relativeAnchorManager = RelativeFrameAnchorManager(view: view)
    }
    
    /// The type used for anchors, which is an array of `RelativeFrameLayoutAnchor`.
    public typealias AnchorType = [RelativeFrameLayoutAnchor]
    
    /// Provides the top anchor relative to the view.
    public var top: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.top)
    }
    
    /// Provides the bottom anchor relative to the view.
    public var bottom: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.bottom)
    }
    
    /// Provides the left anchor relative to the view.
    public var left: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.left)
    }
    
    /// Provides the right anchor relative to the view.
    public var right: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.right)
    }
    
    /// Provides the leading anchor relative to the view.
    public var leading: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.leading)
    }
    
    /// Provides the trailing anchor relative to the view.
    public var trailing: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.trailing)
    }
    
    /// Provides the top margin anchor relative to the view.
    public var topMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.topMargin)
    }
    
    /// Provides the bottom margin anchor relative to the view.
    public var bottomMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.bottomMargin)
    }
    
    /// Provides the left margin anchor relative to the view.
    public var leftMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.top)
    }
    
    /// Provides the right margin anchor relative to the view.
    public var rightMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.rightMargin)
    }
    
    /// Provides all margins as anchors relative to the view.
    public var margins: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.margins)
    }
    
    /// Provides the leading margin anchor relative to the view.
    public var leadingMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.leadingMargin)
    }
    
    /// Provides the trailing margin anchor relative to the view.
    public var trailingMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.trailingMargin)
    }
    
    /// Provides the width anchor relative to the view.
    public var width: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.width)
    }
    
    /// Provides the height anchor relative to the view.
    public var height: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.height)
    }
    
    /// Provides the last baseline anchor relative to the view.
    public var lastBaseline: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.lastBaseline)
    }
    
    /// Provides the first baseline anchor relative to the view.
    public var firstBaseline: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.firstBaseline)
    }
    
    /// Provides all edges as anchors relative to the view.
    public var edges: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.edges)
    }
    
    /// Provides the center anchor relative to the view.
    public var centre: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centre)
    }
    
    /// Provides the center anchor considering margins relative to the view.
    public var centreWithInMargins: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centreWithInMargins)
    }
    
    /// Provides the size anchor relative to the view.
    public var size: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.size)
    }
    
    /// Provides the center Y anchor relative to the view.
    public var centreY: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centerY)
    }
    
    /// Provides the center X anchor relative to the view.
    public var centreX: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centerX)
    }
    
    /// Provides the center X anchor considering margins relative to the view.
    public var centerXWithInMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centerXWithInMargin)
    }
    
    /// Provides the center Y anchor considering margins relative to the view.
    public var centerYWithInMargin: AnchorType {
        return relativeAnchorManager.getRelativeAnchor(.centerYWithInMargin)
    }
}
