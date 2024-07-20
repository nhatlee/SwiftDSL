//
//  Body.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import Foundation
struct WebBody: HtmlTag {
    let children: [HtmlTag]
    
    init(@HtmlBuilder _ content: () -> [HtmlTag]) {
        self.children = content()
    }
    
    func render() -> String {
        "<body>" +
        children
            .map { $0.render() }
            .joined() +
        "</body>"
    }
}
