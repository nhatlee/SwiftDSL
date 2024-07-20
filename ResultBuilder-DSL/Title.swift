//
//  Title.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import Foundation
struct Title: HtmlTag {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    func render() -> String {
        "<title>" + title + "</title>"
    }
}
