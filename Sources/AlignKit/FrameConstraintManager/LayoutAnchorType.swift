enum LayoutAnchorType {
    case yAxis(proxy: NSLayoutYAxisAnchor, superview: NSLayoutYAxisAnchor, negate: Bool)
    case xAxis(proxy: NSLayoutXAxisAnchor, superview: NSLayoutXAxisAnchor, negate: Bool)
    case dimension(proxy: NSLayoutDimension)
}