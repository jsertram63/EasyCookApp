//
//  CreateRecetteViewModel.swift
//  EasyCookApp
//
//  Created by Lunack on 24/10/2022.
//

import Foundation
import SwiftUI

final class CreateRecipeViewModel: ObservableObject {
    
    @Published private(set) var state: SubmissionState?
  
    @Published var newIngredient = NewIngredient(recetteID: "49D9EA18-77D1-4D53-8E7E-7227BB0313CF", name:"poudre de perlin pinpin")
    @Published var newRec = RecipModel(name: "", categorie: "Dessert", imageURL: "", description: "", favoris: false, userID: "8ED6F64E-67E7-4AAC-9BA3-3A2F6196912F")
    
    func create(){
        
        // création d'un encoder
        let encoder  = JSONEncoder()
       // encoder.keyEncodingStrategy = .convertToSnakeCase
        print("====================")
        //print(newRecipe.name)
        print("====================")
        let data = try? encoder.encode(newRec)
        NetworkingManager
            .shared
            .request(methodeType: .POST(data: data), url: "http://137.184.217.221/recette") {[weak self] res in
                
                DispatchQueue.main.async {
                    switch res {
                    case .success:
                        print("success")
                        self?.state = .sucessful
                        break
                    case .failure(let err):
                        print(err)
                        self?.state = .unsuccessful
                        break
                    }
                }
                
            }
        
        
    }
    
    
}


extension CreateRecipeViewModel {
    enum SubmissionState {
        case unsuccessful
        case sucessful
    }
}
