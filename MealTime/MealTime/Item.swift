//
//  Item.swift
//  MealTime
//
//  Created by Никита Соловьев on 30.04.2025.
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
