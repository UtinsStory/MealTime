//
//  RecipesListView.swift
//  MealTime
//
//  Created by Никита Соловьев on 30.04.2025.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject private var viewModel: RecipesListViewModel
    
    init(viewModel: RecipesListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            List(viewModel.recipes) { recipe in
                HStack(alignment: .center, spacing: 12) {
                    AsyncImage(url: URL(string: recipe.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray.opacity(0.2)
                    }
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(recipe.name)
                            .font(.headline)
                        Text("Type: \(recipe.dishTypes.joined(separator: ", "))")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("Preparation time: \(recipe.readyInMinutes) мин.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    
                    Button {
                        viewModel.toggleLike(for: recipe.id)
                    } label: {
                        Image(systemName: recipe.isLiked
                              ? "heart.fill"
                              : "heart"
                        )
                            .foregroundStyle(.red)
                            .imageScale(.large)
                    }
                    .frame(
                        width: 50,
                        height: 50
                    )
                    .contentShape(Rectangle())
                    .buttonStyle(.plain)
                    
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    RecipesListView(viewModel: RecipesListViewModel())
}
