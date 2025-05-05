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
    
    func toggleLike(for recipeId: String) {
        if let index = recipes.firstIndex(where: { $0.id == recipeId }) {
            recipes[index].isLiked.toggle()
        }
    }
}
