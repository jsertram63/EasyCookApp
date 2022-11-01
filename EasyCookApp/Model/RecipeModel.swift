//
//  Recette.swift
//  EasyCookApp
//
//  Created by Lunack on 03/10/2022.
//

import Foundation

class RecipeModel: Codable, Identifiable {
    
    var id =  UUID()
    var name: String = ""
    var imageURL: String = ""
    var ingredients: [Ingredient] = []
    var description: String = ""
    var categorie: Category = Category.appetizer
    var favoris: Bool = false
    
    init(id: UUID = UUID(), name: String, imageURL: String, ingredients: [Ingredient], description: String, categorie: Category, favoris: Bool) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.ingredients = ingredients
        self.description = description
        self.categorie = categorie
        self.favoris = favoris
    }
    // var user: User
}

enum Category: String, CaseIterable, Codable {
    case appetizer = "Entrée"
    case dish = "Plat"
    case dessert = "Dessert"
}

struct Ingredient: Codable, Identifiable, Hashable {
    var id = UUID()
    var name: String
}

//struct User: Codable {
//    var id = UUID()
//}
