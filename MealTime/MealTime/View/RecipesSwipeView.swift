//
//  RecipesSwipeView.swift
//  MealTime
//
//  Created by Никита Соловьев on 30.04.2025.
//

import SwiftUI

struct RecipesSwipeView: View {
    @State private var cards: [RecipeCardModel]
    @State private var translation: CGSize = .zero
    @State private var draggingCard: RecipeCardModel?
    
    init(cards: [RecipeCardModel]) {
        _cards = .init(initialValue: cards)
    }
    
    var body: some View {
        VStack {
            Text("It's meal time!")
                .font(.largeTitle)
                .bold()
                .padding()
            if cards.isEmpty {
                Spacer()
                Text("No recipes found")
                Spacer()
            }
            else {
                ZStack {
                    ForEach(cards) { card in
                        RecipesCardsView(card: card)
                            .offset(card == draggingCard
                                    ? translation
                                    : .zero )
                            .gesture(dragGesture(for: card))
                            .shadow(radius: card == cards.first || card == draggingCard
                                    ? 4
                                    : 0)
                    }
                }
            }
        }
    }
    
    private func dragGesture(for card: RecipeCardModel) -> some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation {
                    if draggingCard != card {
                        draggingCard = card
                    }
                    translation = value.translation
                }
            }
            .onEnded { value in
                withAnimation {
                    if translation.width > .translationThresholdRight {
                        if value.predictedEndLocation.x > value.location.x + .translationEnd {
                            translation = value.predictedEndTranslation
                        } else {
                            translation = CGSize(width: translation.width + .translationEnd, height: translation.height)
                        }
                    } else if translation.width < .translationThresholdLeft {
                        if value.predictedEndLocation.x < value.location.x - .translationEnd {
                            translation = value.predictedEndTranslation
                        } else {
                            translation = CGSize(width: translation.width - .translationEnd, height: translation.height)
                        }
                    } else {
                        draggingCard = nil
                        translation = .zero
                    }
                } completion: {
                    clearSelected()
                }
            }
    }
    
    private func clearSelected() {
        cards.removeAll { $0 == draggingCard }
        draggingCard = nil
        translation = .zero
    }
}

#Preview {
    RecipesSwipeView(cards: Mock().mockCards)
}
