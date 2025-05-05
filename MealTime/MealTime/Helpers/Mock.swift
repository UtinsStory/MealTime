//
//  Mock.swift
//  MealTime
//
//  Created by Никита Соловьев on 30.04.2025.
//

import Foundation

struct Mock {
    
    static let mockCard = RecipeCardModel(
        id: "1",
        imageURL: URL(string: "https://i.pinimg.com/736x/b7/32/83/b7328338a67610535cf33ece0fe92360.jpg")!,
        name: "Chicken with rice",
        description: "TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest"
    )
    
    static let mockCards: [RecipeCardModel] = [
        RecipeCardModel(
            id: "1",
            imageURL: URL(string: "https://i.pinimg.com/736x/b7/32/83/b7328338a67610535cf33ece0fe92360.jpg")!,
            name: "Chicken with rice",
            description: "TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest"
        ),
        RecipeCardModel(
            id: "2",
            imageURL: URL(string: "https://avatars.mds.yandex.net/i?id=5b55033c276e98c4d74a6520d5ec63d100454109f99880bf-13266420-images-thumbs&n=13")!,
            name: "Carbonara",
            description: "TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest"
        ),
        RecipeCardModel(
            id: "3",
            imageURL: URL(string: "https://i.pinimg.com/originals/18/18/8f/18188fcebae69a8eaab0de62d132b8db.jpg")!,
            name: "Caprese avocado",
            description: "TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest"
        )
    ]
    
    static let mockList: [RecipeListModel] = [
        RecipeListModel(
            id: "1",
            name: "Chicken with rice",
            image: "https://i.pinimg.com/736x/b7/32/83/b7328338a67610535cf33ece0fe92360.jpg",
            readyInMinutes: 30,
            dishTypes: ["main course"],
            isLiked: false
        ),
        RecipeListModel(
            id: "2",
            name: "Carbonara",
            image: "https://avatars.mds.yandex.net/i?id=5b55033c276e98c4d74a6520d5ec63d100454109f99880bf-13266420-images-thumbs&n=13",
            readyInMinutes: 25,
            dishTypes: ["pasta", "main course"],
            isLiked: true
        ),
        RecipeListModel(
            id: "3",
            name: "Caprese avocado",
            image: "https://i.pinimg.com/originals/18/18/8f/18188fcebae69a8eaab0de62d132b8db.jpg",
            readyInMinutes: 10,
            dishTypes: ["salad", "starter"],
            isLiked: true
        )
    ]
}
