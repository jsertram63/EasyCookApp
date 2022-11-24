//
//  RecettesListView.swift
//  EasyCookApp
//
//  Created by Lunack on 03/10/2022.
//

import SwiftUI

struct RecipesListView: View {
    
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    // Initialisation d'une propriété d'état servant à présenter la vue UserModificationView
    @State private var showEditUserView: Bool = false
    
    // Initialisation d'une propriété d'état servant à présenter la vue AddRecipeView
    @State private var showAddRecipeView: Bool = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.brown,
            .font : UIFont(name:"Noteworthy", size: 35)!
        ]
    }
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ForEach(recipesVM.categories.keys.sorted(), id: \.self) { key in
                    CategoryRowView(categoryName: key, recipes: recipesVM.categories[key]!)
                }
            }
            // Permet l'affiche d'une vue en cascade
            // Prend en paramètres la variable d'état (binding) et le contenu à afficher
            .sheet(isPresented: $showEditUserView, content: {
                EditUserView()
            })
            .sheet(isPresented: $showAddRecipeView, content: {
                AddRecipeView()
            })
            // Titre de la navigationView
            .navigationTitle("Recettes 📗")
            // Outils complémentaire à la navigationView
            .toolbar {
                // Item gauche
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // Le bouton passe le booléen à true
                        showEditUserView = true
                    } label: {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .foregroundColor(Color.accentColor)
                            .frame(width: 35, height: 35)
                            .fontWeight(.semibold)
                    }
                }
                // item droit
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Le bouton passe le booléen à true
                        showAddRecipeView = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .foregroundColor(Color.accentColor)
                            .frame(width: 35, height: 35)
                            .fontWeight(.semibold)
                    }
                }
            }
            .background(Color.color1)
        }
        .onAppear {
            recipesVM.fetchRecipes()
        }
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
            .environmentObject(RecipesViewModel())
    }
}
