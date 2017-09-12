//
//  SwiftHTML.swift
//  SwiftHTML
//
//  Created by Kyle Watson on 9/11/17.
//
//  Adapted from http://www.fewbutripe.com/swift/html/dsl/2017/06/22/type-safe-html-in-swift.html

import Foundation

public protocol SwiftHTML {}

public class HTML: SwiftHTML {
    let head: Node
    let body: Node
    
    public init(_ head: Node, _ body: Node) {
        self.head = head
        self.body = body
    }
}

extension HTML: CustomStringConvertible {
    public var description: String {
        return "<!doctype html>" + String(describing: node("html", [head, body]))
    }
}

extension SwiftHTML {
    public func node(_ name: String, _ attributes: [Attribute], _ children: [Node]?) -> Node {
        return .element(.init(name, attributes, children))
    }
    
    public func node(_ name: String, _ children: [Node]?) -> Node {
        return node(name, [], children)
    }
    
    public func node(_ name: String, _ child: Node) -> Node {
        return node(name, [child])
    }
    
    // MARK: head convenience
    
    public func head(_ attributes: [Attribute], _ children: [Node]) -> Node {
        return node("head", attributes, children)
    }
    
    public func head(_ children: [Node]) -> Node {
        return head([], children)
    }
    
    public func head(_ child: Node) -> Node {
        return head([child])
    }
    
    // MARK: body convenience
    
    public func body(_ attributes: [Attribute], _ children: [Node]) -> Node {
        return node("body", attributes, children)
    }
    
    public func body(_ children: [Node]) -> Node {
        return body([], children)
    }
    
    public func body(_ child: Node) -> Node {
        return body([child])
    }
    
    // MARK: h1 convenience
    
    public func h1(_ attributes: [Attribute], _ children: [Node]) -> Node {
        return node("h1", attributes, children)
    }
    
    public func h1(_ children: [Node]) -> Node {
        return h1([], children)
    }
    
    public func h1(_ child: Node) -> Node {
        return h1([child])
    }
    
    // MARK: h2 convenience
    
    public func h2(_ attributes: [Attribute], _ children: [Node]) -> Node {
        return node("h2", attributes, children)
    }
    
    public func h2(_ children: [Node]) -> Node {
        return h2([], children)
    }
    
    public func h2(_ child: Node) -> Node {
        return h2([child])
    }
    
    // MARK: ul convenience
    
    public func ul(_ attributes: [Attribute], _ children: [Node]) -> Node {
        return node("ul", attributes, children)
    }
    
    public func ul(_ children: [Node]) -> Node {
        return ul([], children)
    }
    
    // MARK: li convenience
    
    public func li(_ attributes: [Attribute], _ children: [Node]) -> Node {
        return node("li", attributes, children)
    }
    
    public func li(_ children: [Node]) -> Node {
        return li([], children)
    }
    
    public func li(_ child: Node) -> Node {
        return li([child])
    }
    
    // MARK: a convenience
    
    public func a(_ attributes: [Attribute], _ children: [Node]) -> Node {
        return node("a", attributes, children)
    }
    
    public func a(_ attributes: [Attribute], _ child: Node) -> Node {
        return a(attributes, [child])
    }
    
    // MARK: img convenience
    
    public func img(_ attributes: [Attribute], _ children: [Node]? = nil) -> Node {
        return node("img", attributes, children)
    }
    
    // MARK: div convenience
    
    public func div(_ attributes: [Attribute], _ children: [Node]) -> Node {
        return node("div", attributes, children)
    }
    
    public func div(_ children: [Node]) -> Node {
        return div([], children)
    }
    
    public func div(_ child: Node) -> Node {
        return div([child])
    }
    
    // MARK: strong convenience
    
    public func strong(_ attributes: [Attribute], _ children: [Node]) -> Node {
        return node("strong", attributes, children)
    }
    
    public func strong(_ children: [Node]) -> Node {
        return strong([], children)
    }
    
    public func strong(_ child: Node) -> Node {
        return strong([child])
    }
}
