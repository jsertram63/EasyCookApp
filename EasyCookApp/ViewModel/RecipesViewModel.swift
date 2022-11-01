//
//  RecetteViewModel.swift
//  EasyCookApp
//
//  Created by Lunack on 03/10/2022.
//

import Foundation


// on déclare le viewModel en observableObject pour que les propriétés soient observées
class RecipesViewModel : ObservableObject {
    
    
    @Published private(set) var state: SubmissionState?
    
    // on va observé le changement du tableau pour mettre à jour l'UI
    @Published var recipes: [RecipeModel] = []
    @Published var ingredients: [Ingredient] = []
    
    
    var categories: [String: [RecipeModel]] {
        Dictionary(
            grouping: recipes, by: {$0.categorie.rawValue}
        )
    }
    
    let prefixUrl = "http://137.184.217.221/"
    
    /** CRUD RECIPES  ***********************************************************************************************************************************************************************/
    
    // Create function
    
    // Read function
    func fetchRecipes() {
        // formatage de notre adresse à partir du localhost
        guard let url = URL(string: prefixUrl + "recette") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] d, _, err in
            guard let data = d else {
                return
            }
            
            do {
                print(data)
                let recipeFeed = try JSONDecoder().decode([RecipeModel].self, from: data)
                print(recipeFeed)
                DispatchQueue.main.async {
                    self?.recipes = recipeFeed
                }
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    // Update function
    
    // Delete function
    
    /** CRUD INGREDIENTS  *****************************************************************************************************************************************************************/
    
    // Create function
    
    // Read function
    func fetchIngredients() {
        // formatage de notre adresse à partir du localhost
        guard let url = URL(string: prefixUrl + "ingredients") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] d, _, err in
            guard let data = d else {
                return
            }
            
            do {
                print(data)
                let ingredientsFeed = try JSONDecoder().decode([Ingredient].self, from: data)
                print(ingredientsFeed)
                DispatchQueue.main.async {
                    self?.ingredients = ingredientsFeed
                }
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    // Update function
    
    // Delete function
}

extension RecipesViewModel {
    enum SubmissionState {
        case unsuccessful
        case sucessful
    }
}
