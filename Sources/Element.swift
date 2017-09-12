//
//  Element.swift
//  SwiftHTML
//
//  Created by Kyle Watson on 9/11/17.
//
//  Adapted from http://www.fewbutripe.com/swift/html/dsl/2017/06/22/type-safe-html-in-swift.html

import Foundation

public struct Element: CustomStringConvertible {
    let name: String
    let attributes: [Attribute]
    var children: [Node]?
    
    public var description: String {
        let openTagWithAttrs = "<\(name)"
            + (attributes.isEmpty ? "" : " ")
            + attributes.map { String(describing: $0) }.joined(separator: " ")
            + (children == nil ? "" : ">\n")
        let nestedChildren = (children ?? []).map { String(describing: $0) }.joined()
        let closeTag = children == nil ? "/>\n" : "</\(name)>\n"
        
        return openTagWithAttrs + nestedChildren + closeTag
    }
    
    public init(_ name: String, _ attributes: [Attribute], _ children: [Node]?) {
        self.name = name
        self.attributes = attributes
        self.children = children
    }
    
    public mutating func addChildren(_ nodes: [Node]) -> Element {
        if children == nil {
            children = nodes
        } else {
            children?.append(contentsOf: nodes)
        }
        return self
    }
}
