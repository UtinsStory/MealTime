//
//  RecipesSwipeView.swift
//  MealTime
//
//  Created by Никита Соловьев on 30.04.2025.
//

import SwiftUI

struct RecipesSwipeView: View {
    @StateObject private var viewModel: RecipesSwipeViewModel
    @State private var translation: CGSize = .zero
    @State private var draggingCard: RecipeCardModel?
    
    init(viewModel: RecipesSwipeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text("It's meal time!")
                .font(.largeTitle)
                .bold()
                .padding(.vertical, 20)

            if viewModel.cards.isEmpty {
                Spacer()
                VStack {
                    Text("No recipes found")
                        .font(.title)
                    Button {
                        viewModel.loadCards()
                    } label: {
                        Image(systemName: "arrow.clockwise.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.blue)
                    }

                }
                Spacer()
            }
            else {
                ZStack {
                    ForEach(viewModel.cards.reversed().indices, id: \.self) { index in
                        let card = viewModel.cards.reversed()[index]
                        let topCard = viewModel.cards.first
                        RecipesCardsView(card: card, isTopCard: card == topCard)
                            .offset(card == draggingCard
                                    ? translation
                                    : .zero )
                            .offset(y: CGFloat(index) * 5)
                            .gesture(dragGesture(for: card))
                            .shadow(radius: card == viewModel.cards.last || card == draggingCard
                                    ? 4
                                    : 0)
                            .zIndex(card == draggingCard ? 1 : 0)
                    }
                }
                .padding(.vertical, 20)
                Spacer()
            }
        }
    }
    
    private func dragGesture(for card: RecipeCardModel) -> some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation(.easeInOut) {
                    if draggingCard != card {
                        draggingCard = card
                    }
                    translation = value.translation
                }
            }
            .onEnded { value in
                withAnimation(.easeInOut) {
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
        if let card = draggingCard {
            viewModel.removeCard(card)
        }
        draggingCard = nil
        translation = .zero
    }
}

#Preview {
    RecipesSwipeView(viewModel: RecipesSwipeViewModel())
}
