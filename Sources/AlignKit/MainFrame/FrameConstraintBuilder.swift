//
//  FrameConstraintBuilder.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//

import UIKit


/// `FrameConstraintBuilder` is responsible for constructing and managing layout constraints
/// for a given `FrameProxy`. It provides properties to access various layout anchors
/// and methods to generate and manipulate constraints based on `FrameDescription`.
public class FrameConstraintBuilder: FrameAnchorable {
    
    /// The proxy view associated with this constraint builder.
    var proxyView: FrameProxy
    
    /// An array of `FrameDescription` objects that hold information about the constraints.
    var descriptions: [FrameDescription] = []
    
    /// Initializes a new instance of `FrameConstraintBuilder` with the specified proxy view.
    /// - Parameter proxyView: The `FrameProxy` associated with this builder.
    init(proxyView: FrameProxy) {
        self.proxyView = proxyView
    }
    
    /// A typealias for `FrameConstraintBuilderExtended` to simplify access to anchor types.
    public typealias AnchorType = FrameConstraintBuilderExtended
    
    // MARK: - Anchor Properties

    /// The top anchor of the frame.
    public var top: AnchorType { storeAnchor(.top) }
    
    /// The bottom anchor of the frame.
    public var bottom: AnchorType { storeAnchor(.bottom) }
    
    /// The left anchor of the frame.
    public var left: AnchorType { storeAnchor(.left) }
    
    /// The right anchor of the frame.
    public var right: AnchorType { storeAnchor(.right) }
    
    /// The leading anchor of the frame.
    public var leading: AnchorType { storeAnchor(.leading) }
    
    /// The trailing anchor of the frame.
    public var trailing: AnchorType { storeAnchor(.trailing) }
    
    /// The top margin anchor of the frame.
    public var topMargin: AnchorType { storeAnchor(.topMargin) }
    
    /// The bottom margin anchor of the frame.
    public var bottomMargin: AnchorType { storeAnchor(.bottomMargin) }
    
    /// The left margin anchor of the frame.
    public var leftMargin: AnchorType { storeAnchor(.leftMargin) }
    
    /// The right margin anchor of the frame.
    public var rightMargin: AnchorType { storeAnchor(.rightMargin) }
    
    /// The margin anchors of the frame.
    public var margins: AnchorType { storeAnchor(.margins) }
    
    /// The leading margin anchor of the frame.
    public var leadingMargin: AnchorType { storeAnchor(.leadingMargin) }
    
    /// The trailing margin anchor of the frame.
    public var trailingMargin: AnchorType { storeAnchor(.trailingMargin) }
    
    /// The width anchor of the frame.
    public var width: AnchorType { storeAnchor(.width) }
    
    /// The height anchor of the frame.
    public var height: AnchorType { storeAnchor(.height) }
    
    /// The last baseline anchor of the frame.
    public var lastBaseline: AnchorType { storeAnchor(.lastBaseline) }
    
    /// The first baseline anchor of the frame.
    public var firstBaseline: AnchorType { storeAnchor(.firstBaseline) }
    
    /// The edges of the frame.
    public var edges: AnchorType { storeAnchor(.edges) }
    
    /// The center anchors of the frame.
    public var centre: AnchorType { storeAnchor(.centre) }
    
    /// The center anchors within margins of the frame.
    public var centreWithInMargins: AnchorType { storeAnchor(.centreWithInMargins) }
    
    /// The size anchors of the frame.
    public var size: AnchorType { storeAnchor(.size) }
    
    /// The center Y anchor of the frame.
    public var centreY: AnchorType { storeAnchor(.centerY) }
    
    /// The center X anchor of the frame.
    public var centreX: AnchorType { storeAnchor(.centerX) }
    
    /// The center X anchor within margins of the frame.
    public var centerXWithInMargin: AnchorType { storeAnchor(.centerXWithInMargin) }
    
    /// The center Y anchor within margins of the frame.
    public var centerYWithInMargin: AnchorType { storeAnchor(.centerYWithInMargin) }
    
    // MARK: - Private Methods
    
    /// Stores the given anchor in the descriptions array and returns an instance of `FrameConstraintBuilderExtended`.
    /// - Parameter anchor: The `FrameLayoutAttribute` to store.
    /// - Returns: An instance of `FrameConstraintBuilderExtended`.
    private func storeAnchor(_ anchor: FrameLayoutAttribute) -> FrameConstraintBuilderExtended {
        let description = FrameDescription(proxyView: self.proxyView, layoutAttribute: anchor)
        self.descriptions.append(description)
        return FrameConstraintBuilderExtended(description)
    }
    
    // MARK: - Constraint Generation Methods
    
    /// Generates layout constraints based on the provided `FrameDescription`.
    /// - Parameter frameDescription: The `FrameDescription` containing details for constraint generation.
    /// - Returns: An array of `NSLayoutConstraint` generated from the description.
    
    static func generateConstraints(frameDescription: FrameDescription) -> [NSLayoutConstraint] {
        switch frameDescription.relativeConstraintType {
        case .equalTo:
            let constraintManager = EqualToConstraintManager(frameDescription: frameDescription)
            return constraintManager.generateConstraints(relativeAnchors: frameDescription.relativeAnchors)
        case .lessThanOrEqualTo:
            let constraintManager = LessThanOrEqualToConstraintManager(frameDescription: frameDescription)
            return constraintManager.generateConstraints(relativeAnchors: frameDescription.relativeAnchors)
        case .greaterThanOrEqualTo:
            let constraintManager = GreaterThanOrEqualToConstraintManager(frameDescription: frameDescription)
            return constraintManager.generateConstraints(relativeAnchors: frameDescription.relativeAnchors)
        }
    }
    
    /// Activates constraints based on the provided `FrameDescription`.
    /// - Parameter frameDescription: The `FrameDescription` containing details for activating constraints.
    
    static func makeConstraints(frameDescription: FrameDescription) {
        let constraints = generateConstraints(frameDescription: frameDescription)
        for constraint in constraints {
            constraint.activateIfNeeded(description: frameDescription)
        }
    }
    
    /// Updates constraints based on the provided `FrameDescription`.
    /// - Parameter frameDescription: The `FrameDescription` containing details for updating constraints.
    
    static func updateConstraints(frameDescription: FrameDescription) {
        let constraints = generateConstraints(frameDescription: frameDescription)
        for constraint in constraints {
            constraint.updateIfNeeded(description: frameDescription)
        }
    }
    
    /// Removes constraints based on the provided `FrameDescription`.
    /// - Parameter frameDescription: The `FrameDescription` containing details for removing constraints.
    
    static func removeConstraints(frameDescription: FrameDescription) {
        let constraints = generateConstraints(frameDescription: frameDescription)
        for constraint in constraints {
            constraint.removeIfNeeded(description: frameDescription)
        }
    }
    
    /// Removes all the constraints based on the provided `view`.
    
    static func removeConstraints(view: UIView) {
        let constraints = view.constraints
        for constraint in constraints {
            constraint.deactivateIfNeeded()
        }
    }
}
