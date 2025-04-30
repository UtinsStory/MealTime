//
//  RecipeCardModel.swift
//  MealTime
//
//  Created by Никита Соловьев on 30.04.2025.
//

import Foundation

struct RecipeCardModel:Identifiable, Equatable {
    let id: String
    let imageURL: URL
    let name: String
    let description: String
}
