//
//  Attribute.swift
//  SwiftHTML
//
//  Created by Kyle Watson on 9/11/17.
//
//  Adapted from http://www.fewbutripe.com/swift/html/dsl/2017/06/22/type-safe-html-in-swift.html

import Foundation

public let id = AttributeKey<String>("id")
public let href = AttributeKey<String>("href")
public let src = AttributeKey<String>("src")

public struct Attribute: CustomStringConvertible {
    let key: String
    let value: String
    
    public var description: String {
        return "\(key)=\"\(value)\""
    }
    
    public init(_ key: String, _ value: String) {
        self.key = key
        self.value = value
    }
}

public struct AttributeKey<A> {
    let key: String
    public init(_ key: String) {
        self.key = key
    }
}

infix operator =>
public func => <A> (key: AttributeKey<A>, value: A) -> Attribute {
    return .init(key.key, "\(value)")
}
