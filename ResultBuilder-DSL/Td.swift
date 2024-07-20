//
//  Td.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import Foundation
struct Td<Value: CustomStringConvertible>: HtmlTag {
    let data: Value
    
    init(_ data: Value) {
        self.data = data
    }
    
    func render() -> String {
        "<td style='text-align:center; vertical-align:middle'>" + data.description + "</td>"
    }
}
