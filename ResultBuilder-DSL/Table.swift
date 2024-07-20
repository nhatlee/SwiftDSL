//
//  Table.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import Foundation
struct Table: HtmlTag {
    let rows: [HtmlTag]
    
    init(@HtmlBuilder _ content: () -> [HtmlTag]) {
        self.rows = content()
    }
    
    func render() -> String {
        "<table> <style> table { border: 1px solid;} </style>" +
        rows
            .map { $0.render() }
            .joined() +
        "</table>"
    }
}
