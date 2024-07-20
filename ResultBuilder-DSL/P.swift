//
//  P.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import Foundation
struct P: HtmlTag {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    func render() -> String {
        "<p>" + text + "</p>"
    }
}
