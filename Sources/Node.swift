//
//  Node.swift
//  SwiftHTML
//
//  Created by Kyle Watson on 9/11/17.
//
//  Adapted from http://www.fewbutripe.com/swift/html/dsl/2017/06/22/type-safe-html-in-swift.html

import Foundation

public enum Node: CustomStringConvertible {
    case element(Element)
    case text(String)
    
    public var description: String {
        switch self {
        case let .element(e):
            return String(describing: e)
        case let .text(t):
            return t
        }
    }
}

extension Node: ExpressibleByStringLiteral {
    public init(unicodeScalarLiteral value: UnicodeScalar) {
        self.init(stringLiteral: String(value))
    }
    
    public init(extendedGraphemeClusterLiteral value: Character) {
        self.init(stringLiteral: String(value))
    }
    
    public init(stringLiteral value: String) {
        self = .text(value)
    }
}
