//
//  IngredientsListView.swift
//  EasyCookApp
//
//  Created by Pierric Marye on 07/10/2022.
//

import SwiftUI

struct IngredientsListView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    @State private var showAddIngredient: Bool = false
    
    @State private var search = ""
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.brown,
            .font : UIFont(name:"Noteworthy", size: 35)!
        ]
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipesVM.ingredients, id: \.self) { ingredient in
                    NavigationLink {
                        EditIngredientView()
                    } label: {
                        Text(ingredient.name)
                            .foregroundColor(Color.accentColor)
                    }
                }
                // Couleur de fond de fond des cellules
                .listRowBackground(Color.accentColor.opacity(0.25))
                .padding(.vertical, 5.0)
            }
            // Titre de la navigationView
            .navigationTitle("Mes ingrédients 🥗")
            // Outils complémentaire à la navigationView
            .toolbar {
                // item droit
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Le bouton passe le booléen à true
                        showAddIngredient = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .foregroundColor(Color.accentColor)
                            .frame(width: 35, height: 35)
                            .fontWeight(.medium)
                    }
                }
            }
            .sheet(isPresented: $showAddIngredient) {
                AddIngredientView()
            }
        }
        .searchable(text: $search, prompt: "rechercher")
        .onAppear {
            UITabBar.appearance().backgroundColor = .systemGray5
            recipesVM.fetchIngredients()
        }
    }
}

struct IngredientsListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsListView()
            .environmentObject(RecipesViewModel())
    }
}


extension IngredientsListView {
    enum SubmissionState {
        case unsuccessful
        case sucessful
    }
}
