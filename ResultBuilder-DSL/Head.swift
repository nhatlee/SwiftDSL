//
//  Head.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import Foundation
struct Head: HtmlTag {
    let children: [HtmlTag]
    
    init(@HtmlBuilder _ content: () -> [HtmlTag]) {
        self.children = content()
    }
    
    func render() -> String {
        "<head>" +
        children
            .map { $0.render() }
            .joined() +
        "</head>"
    }
}
