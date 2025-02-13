//
//  RelationalFrameConstraintBuilder.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//

import UIKit


/// `RelationalFrameConstraintBuilder` is a class designed to facilitate the creation of layout constraints
/// that are relational to other views or constants. It allows for flexible constraints by specifying
/// relationships like equal, less than, or greater than to superviews or specified anchors.
public class RelationalFrameConstraintBuilder {
    
    /// The `FrameDescription` associated with this builder, containing layout attributes and constraints.
    var frameDescription: FrameDescription
    
    /// Initialises a new instance of `RelationalFrameConstraintBuilder` with a given `FrameDescription`.
    /// - Parameter frameDescription: The `FrameDescription` that will be used for building constraints.
    init(_ frameDescription: FrameDescription) {
        self.frameDescription = frameDescription
    }

    /// Specifies that the constraint should be equal to the superview's corresponding attribute.
    /// - Parameters:
    ///   - file: The file name where the constraint is being defined (default is the current file).
    ///   - line: The line number where the constraint is being defined (default is the current line).
    /// - Returns: An instance of `ModifiableFrameConstraintBuilder` for further modification.
    @discardableResult
    public func equalToSuperview(_ file: String = #file, _ line: UInt = #line) -> ModifiableFrameConstraintBuilder {
        
        self.frameDescription.relativeConstraintType = .equalTo
        self.frameDescription.sourceLocation = (file, line)
        
        return ModifiableFrameConstraintBuilder(frameDescription: self.frameDescription)
    }
    
    /// Specifies that the constraint should be equal to a constant value or relative anchor.
    /// - Parameters:
    ///   - constant: The constant value or relative anchor to set the constraint.
    ///   - file: The file name where the constraint is being defined (default is the current file).
    ///   - line: The line number where the constraint is being defined (default is the current line).
    /// - Returns: An instance of `ModifiableFrameConstraintBuilder` for further modification.
    @discardableResult
    public func equalTo(_ constant: ConstraintConstantValue, _ file: String = #file, _ line: UInt = #line) -> ModifiableFrameConstraintBuilder {
        
        self.frameDescription.relativeConstraintType = .equalTo
        self.frameDescription.constant = constant
        if let anchors = constant as? [RelativeFrameLayoutAnchor] {
            self.frameDescription.relativeAnchors = anchors
        }
        self.frameDescription.sourceLocation = (file, line)
        
        return ModifiableFrameConstraintBuilder(frameDescription: self.frameDescription)
    }
    
    // MARK: - LessThanOrEqual
    
    /// Specifies that the constraint should be less than or equal to the superview's corresponding attribute.
    /// - Parameters:
    ///   - file: The file name where the constraint is being defined (default is the current file).
    ///   - line: The line number where the constraint is being defined (default is the current line).
    /// - Returns: An instance of `ModifiableFrameConstraintBuilder` for further modification.
    @discardableResult
    public func lessThanOrEqualToSuperview(_ file: String = #file, _ line: UInt = #line) -> ModifiableFrameConstraintBuilder {
        
        self.frameDescription.relativeConstraintType = .lessThanOrEqualTo
        self.frameDescription.sourceLocation = (file, line)
       
        return ModifiableFrameConstraintBuilder(frameDescription: self.frameDescription)
    }
    
    /// Specifies that the constraint should be less than or equal to either given relative anchors or constant value.
    /// - Parameters:
    ///   - constant: The constant value or relative anchor to set the constraint.
    ///   - file: The file name where the constraint is being defined (default is the current file).
    ///   - line: The line number where the constraint is being defined (default is the current line).
    /// - Returns: An instance of `ModifiableFrameConstraintBuilder` for further modification.
    @discardableResult
    public func lessThanOrEqualTo(_ constant: ConstraintConstantValue, _ file: String = #file, _ line: UInt = #line) -> ModifiableFrameConstraintBuilder {
        
        self.frameDescription.relativeConstraintType = .lessThanOrEqualTo
        self.frameDescription.constant = constant
        if let anchors = constant as? [RelativeFrameLayoutAnchor] {
            self.frameDescription.relativeAnchors = anchors
        }
        self.frameDescription.sourceLocation = (file, line)
    
        return ModifiableFrameConstraintBuilder(frameDescription: self.frameDescription)
    }
    
    // MARK: - GreaterThanOrEqual
    
    /// Specifies that the constraint should be greater than or equal to the superview's corresponding attribute.
    /// - Parameters:
    ///   - file: The file name where the constraint is being defined (default is the current file).
    ///   - line: The line number where the constraint is being defined (default is the current line).
    /// - Returns: An instance of `ModifiableFrameConstraintBuilder` for further modification.
    @discardableResult
    public func greaterThanOrEqualToSuperview(_ file: String = #file, _ line: UInt = #line) -> ModifiableFrameConstraintBuilder {
        
        self.frameDescription.relativeConstraintType = .greaterThanOrEqualTo
        self.frameDescription.sourceLocation = (file, line)
        
        return ModifiableFrameConstraintBuilder(frameDescription: self.frameDescription)
    }
    
    /// Specifies that the constraint should be greater than or equal to either given relative anchors or constant value.
    /// - Parameters:
    ///   - constant: The constant value or relative anchor to set the constraint.
    ///   - file: The file name where the constraint is being defined (default is the current file).
    ///   - line: The line number where the constraint is being defined (default is the current line).
    /// - Returns: An instance of `ModifiableFrameConstraintBuilder` for further modification.
    @discardableResult
    public func greaterThanOrEqualTo(_ constant: ConstraintConstantValue, _ file: String = #file, _ line: UInt = #line) -> ModifiableFrameConstraintBuilder {
        
        self.frameDescription.relativeConstraintType = .greaterThanOrEqualTo
        self.frameDescription.constant = constant
        if let anchors = constant as? [RelativeFrameLayoutAnchor] {
            self.frameDescription.relativeAnchors = anchors
        }
        self.frameDescription.sourceLocation = (file, line)
        
        return ModifiableFrameConstraintBuilder(frameDescription: self.frameDescription)
    }
}
