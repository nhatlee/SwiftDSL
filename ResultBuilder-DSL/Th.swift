//
//  Th.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import Foundation
struct Th: HtmlTag {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    func render() -> String {
        "<th style='width:200px; background-color: #dddddd'>" + title + "</th>"
    }
}
