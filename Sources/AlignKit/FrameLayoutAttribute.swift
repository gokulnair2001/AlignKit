//
//  FrameLayoutAttribute.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//


struct FrameLayoutAttribute: OptionSet {
    
    let rawValue: UInt
    
    static let none = FrameLayoutAttribute([])
    
    static let left = FrameLayoutAttribute(rawValue: 1 << 0)
    static let top = FrameLayoutAttribute(rawValue: 1 << 1)
    static let right = FrameLayoutAttribute(rawValue: 1 << 2)
    static let bottom = FrameLayoutAttribute(rawValue: 1 << 3)
    static let leading = FrameLayoutAttribute(rawValue: 1 << 4)
    static let trailing = FrameLayoutAttribute(rawValue: 1 << 5)
    
    static let width = FrameLayoutAttribute(rawValue: 1 << 6)
    static let height = FrameLayoutAttribute(rawValue: 1 << 7)
    
    static let lastBaseline = FrameLayoutAttribute(rawValue: 1 << 8)
    static let firstBaseline = FrameLayoutAttribute(rawValue: 1 << 9)
    
    static let leftMargin = FrameLayoutAttribute(rawValue: 1 << 10)
    static let topMargin = FrameLayoutAttribute(rawValue: 1 << 11)
    static let rightMargin = FrameLayoutAttribute(rawValue: 1 << 12)
    static let bottomMargin = FrameLayoutAttribute(rawValue: 1 << 13)
    static let leadingMargin = FrameLayoutAttribute(rawValue: 1 << 14)
    static let trailingMargin = FrameLayoutAttribute(rawValue: 1 << 15)
    
    static let centerX = FrameLayoutAttribute(rawValue: 1 << 16)
    static let centerY = FrameLayoutAttribute(rawValue: 1 << 17)
    
    static let centerXWithInMargin = FrameLayoutAttribute(rawValue: 1 << 18)
    static let centerYWithInMargin = FrameLayoutAttribute(rawValue: 1 << 19)
    
    static let directionalEdges: FrameLayoutAttribute = [.top, .bottom, .leading, .trailing]
    static let directionalMargins: FrameLayoutAttribute = [.topMargin, .bottomMargin, .leadingMargin, .trailingMargin]
    
    static let edges: FrameLayoutAttribute = [.top, .bottom, .left, .right]
    static let margins: FrameLayoutAttribute = [.topMargin, .bottomMargin, .leftMargin, .rightMargin]
    
    static let centre: FrameLayoutAttribute = [.centerX, .centerY]
    static let centreWithInMargins: FrameLayoutAttribute = [.centerXWithInMargin, .centerYWithInMargin]
    
    static let size: FrameLayoutAttribute = [.width, .height]
    
}

internal func + (left: FrameLayoutAttribute, right: FrameLayoutAttribute) -> FrameLayoutAttribute {
    return left.union(right)
}

internal func +=(left: inout FrameLayoutAttribute, right: FrameLayoutAttribute) {
    left.formUnion(right)
}

internal func -=(left: inout FrameLayoutAttribute, right: FrameLayoutAttribute) {
    left.subtract(right)
}

internal func ==(left: FrameLayoutAttribute, right: FrameLayoutAttribute) -> Bool {
    return left.rawValue == right.rawValue
}
