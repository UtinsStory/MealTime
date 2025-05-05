//
//  RecipesListViewModel.swift
//  MealTime
//
//  Created by Никита Соловьев on 05.05.2025.
//

import Foundation

final class RecipesListViewModel: ObservableObject {
    
    @Published var recipes: [RecipeListModel] = []
    
    init() {
        loadRecipes()
    }
    
    func loadRecipes() {
        recipes = Mock.mockList
    }
}
