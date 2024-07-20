//
//  Tr.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import Foundation
struct Tr: HtmlTag {
    let columns: [HtmlTag]
    
    init(@HtmlBuilder _ content: () -> [HtmlTag]) {
        self.columns = content()
    }
    
    func render() -> String {
        "<tr> <style> tr:nth-child(even) { background-color: #dddddd;}</style>" +
        columns
            .map { $0.render() }
            .joined() +
        "</tr>"
    }
}
