//
//  Item.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
