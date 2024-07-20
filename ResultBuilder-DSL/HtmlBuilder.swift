//
//  HtmlBuilder.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import Foundation
@resultBuilder
struct HtmlBuilder {
    static func buildBlock() -> [HtmlTag] {
        []
    }
    
    static func buildBlock(_ components: HtmlTag...) -> [HtmlTag] {
        components
    }
    
    static func buildBlock(_ components: [HtmlTag]...) -> [HtmlTag] {
        components.flatMap { $0 }
    }
    
    static func buildArray(_ components: [[HtmlTag]]) -> [HtmlTag] {
        components.flatMap { $0 }
    }
    
    static func buildExpression(_ expression: HtmlTag) -> [HtmlTag] {
        [expression]
    }
    
    static func buildOptional(_ component: [HtmlTag]?) -> [HtmlTag] {
        component ?? []
    }
    
    static func buildEither(first component: [HtmlTag]) -> [HtmlTag] {
        component
    }
    
    static func buildEither(second component: [HtmlTag]) -> [HtmlTag] {
        component
    }
}
