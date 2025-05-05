//
//  RecipesCardsView.swift
//  MealTime
//
//  Created by Никита Соловьев on 30.04.2025.
//

import SwiftUI

struct RecipesCardsView: View {
    let card: RecipeCardModel
    let isTopCard: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            if isTopCard {
                Text(card.name)
                    .font(.headline)
                    .padding(.vertical, 16)
            }
                
            Color(.systemFill)
                .overlay {
                    AsyncImage(url: card.imageURL) { image in
                        image.resizable().aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                }
                .frame(height: 400)
                .cornerRadius(12)
                .clipped()
            if isTopCard {
                Text(card.description)
                    .font(.subheadline)
                    .lineLimit(0)
                    .padding(.horizontal)
                    .padding(.bottom, 16)
            }
        }
        .cornerRadius(12)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    RecipesCardsView(card: Mock().mockCard, isTopCard: true)
}
