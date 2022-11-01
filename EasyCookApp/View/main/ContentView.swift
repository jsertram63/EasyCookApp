//
//  ContentView.swift
//  EasyCookApp
//
//  Created by Lunack on 03/10/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var recipesVM:  RecipesViewModel
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Accueil",systemImage: "house")
                }
            
            RecipesListView()
                .tabItem {
                    Label("Recette",systemImage: "text.book.closed")
                }
            IngredientsListView()
                .tabItem{
                    Label("Ingrédients", systemImage: "cooktop.fill")
                }
            
            PrivacyView()
                .tabItem{
                    Label("Remerciements", systemImage: "lock.circle")
                }
        }
        .onAppear {
            UITabBar.appearance().backgroundColor = .systemGray5
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
