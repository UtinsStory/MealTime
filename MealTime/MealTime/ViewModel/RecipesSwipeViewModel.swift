//
//  RecipesSwipeViewModel.swift
//  MealTime
//
//  Created by Никита Соловьев on 05.05.2025.
//

import Foundation

final class RecipesSwipeViewModel: ObservableObject {
    
    @Published var cards: [RecipeCardModel] = []
    
    init() {
        loadCards()
    }
    
    func loadCards() {
        cards = Mock().mockCards
    }
    
    func removeCard(_ card: RecipeCardModel) {
        cards.removeAll { $0 == card }
    }
}
