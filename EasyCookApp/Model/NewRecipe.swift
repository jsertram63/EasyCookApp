//
//  NewRecipe.swift
//  EasyCookApp
//
//  Created by Lunack on 24/10/2022.
//

import Foundation

struct RecipModel: Codable {
    var name : String
    var categorie: String
    var imageURL: String
    var description: String
    var favoris: Bool
    var userID: String
}
