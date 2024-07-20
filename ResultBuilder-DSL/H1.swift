//
//  H1.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import Foundation
struct H1: HtmlTag {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    func render() -> String {
        "<h1>" + text + "</h1>"
    }
}
