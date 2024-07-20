//
//  Img.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import Foundation

struct Attribute {
    let key: String
    let value: String
}

struct Img: HtmlTag {
    private var attributes: [Attribute] = []
    
    init(url: String) {
        self.attributes.append(Attribute(key: "src", value: url))
    }

    func render() -> String {
        return "<img " + buildAttributes() + ">"
    }
    
    private func buildAttributes() -> String {
        var attributesString = ""
        
        for attribute in attributes {
            attributesString.append(attribute.key + "=" + "\"\(attribute.value)\" ")
        }
        
        print(attributesString)
        return attributesString
    }
}

extension Img {
    func alt(text: String) -> Self {
        var newImage = self
        newImage.attributes.append(Attribute(key: "alt", value: text))

        return newImage
    }
    
    func style(width: Int?, height: Int?) -> Self {

        var newImage = self
        
        if let width {
            newImage.attributes.append(Attribute(key: "width", value: "\(width)"))
        }
        
        if let height {
            newImage.attributes.append(Attribute(key: "height", value: "\(height)"))
        }
        
        return newImage
    }
}
