//
//  Meta.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import Foundation
struct Meta: HtmlTag {
    let name: String
    let content: String
    
    func render() -> String {
        "<meta name=\"\(name)\" content=\"\(content)\">"
    }
}
