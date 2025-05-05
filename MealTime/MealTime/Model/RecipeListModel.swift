//
//  RecipeListModel.swift
//  MealTime
//
//  Created by Никита Соловьев on 05.05.2025.
//

import Foundation

struct RecipeListModel: Identifiable, Equatable {
    let id: String
    let name: String
    let image: String
    let readyInMinutes: Int
    let dishTypes: [String]
}
