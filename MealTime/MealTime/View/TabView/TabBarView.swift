//
//  TabBarView.swift
//  MealTime
//
//  Created by Никита Соловьев on 05.05.2025.
//

import SwiftUI

enum TabTag {
    case list
    case cards
    case favorites
}

struct TabBarView: View {
    @State private var selectedTab: TabTag = .cards
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        let lineHeight = 1.0
        let rect = CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: lineHeight
        )
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        UIColor.lightGray.setFill()
        UIRectFill(rect)
        
        let onePixelImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        appearance.shadowImage = onePixelImage
        appearance.shadowColor = nil
        
        UITabBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            RecipesSwipeView(cards: Mock().mockCards)
                .tabItem {
                    Text("Карточки")
                    Image(systemName: "square.stack")
                }
                .tag(TabTag.cards)
            
            RecipesListView()
                .tabItem {
                    Text("Список")
                    Image(systemName: "list.clipboard")
                }
                .tag(TabTag.list)
        }
    }
}

#Preview {
    TabBarView()
}
