//
//  RecipeListModel.swift
//  MealTime
//
//  Created by Никита Соловьев on 05.05.2025.
//

import Foundation

struct RecipeListModel: Identifiable, Equatable, Hashable {
    let id: String
    let name: String
    var image: String
    let readyInMinutes: Int
    let dishTypes: [String]
    
    var isLiked: Bool
}
