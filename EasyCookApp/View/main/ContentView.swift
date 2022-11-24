//
//  ContentView.swift
//  EasyCookApp
//
//  Created by Lunack on 03/10/2022.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.color2)
    }
    
    @EnvironmentObject var recipesVM:  RecipesViewModel
    
    var body: some View {
        TabView {
            Group {
                HomeView()
                    .tabItem {
                        Label("Accueil",systemImage: "house")
                    }
                
                RecipesListView()
                    .tabItem {
                        Label("Recette",systemImage: "text.book.closed")
                    }
                IngredientsListView()
                    .tabItem {
                        Label("Ingrédients", systemImage: "cooktop.fill")
                    }
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(Color.color2, for: .tabBar)
        }
        .onAppear {
            recipesVM.fetchRecipes()
            recipesVM.fetchIngredients()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipesViewModel())
    }
}
