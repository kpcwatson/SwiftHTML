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
    let children: [Node]?
    
    public init(_ name: String, _ attributes: [Attribute], _ children: [Node]?) {
        self.name = name
        self.attributes = attributes
        self.children = children
    }
    
    public var description: String {
        let openTagWithAttrs = "<\(name)"
            + (attributes.isEmpty ? "" : " ")
            + attributes.map { String(describing: $0) }.joined(separator: " ")
            + (children == nil ? "" : ">")
        let nestedChildren = (children ?? []).map { String(describing: $0) }.joined()
        let closeTag = children == nil ? "/>" : "</\(name)>"
        
        return openTagWithAttrs + nestedChildren + closeTag
    }
}
