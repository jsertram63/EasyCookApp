//
//  RecipeDetailsView.swift
//  EasyCookApp
//
//  Created by Pierric Marye on 07/10/2022.
//

import SwiftUI

struct RecipeDetailsView: View {
    
    @EnvironmentObject var recipesVM: RecipesViewModel
    var recipe: RecipeModel
    
    @State private var showEditRecipe: Bool = false
    // Permet l'adaptation des proportions d'une taille (frame)
    let screenSize = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.color1.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                // Permet la réccupération d'une image via url
                // prend en paramètre cet url de type String
                // Avec une closure on assigne une image avec ses modifyers
                // un alternative "placerholder" permet de remplacer l'image en attente
                AsyncImage(url: URL(string: recipe.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width)
                        .clipped()
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 5.0)
                        .overlay(alignment: .bottomTrailing) {
                            Text("©EasyCookApp")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .offset(x: -6, y: -5)
                        }
                        .overlay(alignment: .topTrailing) {
                            Button {
                                showEditRecipe.toggle()
                            } label: {
                                Image(systemName: "pencil")
                                    .font(.headline)
                                    .foregroundColor(.accentColor)
                                    .padding(5.0)
                                    .background(Color.color2)
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.5), radius: 3, x: 0, y: 0)
                                    .offset(x: -5,y: 5)
                            }
                        }
                    
                } placeholder: {
                    ProgressView()
                }
                
                VStack(spacing: 30.0) {
                    // Recipe title
                    Text(recipe.name)
                        .font(Font.custom("Noteworthy Bold", size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    
                    // Contents text of Recipe
                    VStack(spacing: 25.0) {
                        // Recipe ingredients
                        VStack(spacing: 20) {
                            Text("Ingrédients")
                                .font(.headline)
                            VStack(alignment: .leading) {
                                // On dit que pour chaque ingredients récupérés on affiche son nom
                                ForEach(recipe.ingredients) { ingredient in
                                    Text(ingredient.name)
                                }
                            }
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        // Modifyer prenant en paramètre la largeur où on définir le ratio
                        .frame(width: screenSize.width * 0.90)
                        .background(Color.color2)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
                        
                        // Recipes directions
                        VStack(spacing: 20) {
                            Text("Préparation")
                                .font(.headline)
                            Text(recipe.description)
                        }
                        .padding(.all)
                        .frame(width: screenSize.width * 0.90)
                        .background(Color.color2)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    }
                }
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showEditRecipe) {
                EditRecipeView()
            }
        }
    }
}
