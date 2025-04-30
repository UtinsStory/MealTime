//
//  RecipesCardsView.swift
//  MealTime
//
//  Created by Никита Соловьев on 30.04.2025.
//

import SwiftUI

struct RecipesCardsView: View {
    let card: RecipeCardModel
    
    var body: some View {
        Text(card.name)
            .font(.headline)
            .padding(.top, 100)
        
        VStack(alignment: .leading, spacing: 8) {
            Color(.systemFill)
                .overlay {
                    AsyncImage(url: card.imageURL) { image in
                        image.resizable().aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
            Text(card.description)
                .font(.subheadline)
                .lineLimit(0)
                .padding()
        }
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .padding(.top, 20)
        .padding(.bottom, 200)
        .padding(.horizontal, 20)
    }
}

#Preview {
    RecipesCardsView(card: Mock().mockCard)
}
