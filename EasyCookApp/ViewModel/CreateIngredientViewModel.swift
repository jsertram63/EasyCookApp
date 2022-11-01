//
//  CreateIngredientViewModel.swift
//  EasyCookApp
//
//  Created by Lunack on 31/10/2022.
//

import SwiftUI

final class CreateIngredientViewModel: ObservableObject {
    
    @Published var newIngredient = NewIngredient(recetteID: "9CD14A39-D3A6-4099-B0B1-5AEA79719854", name: "")
    @Published private(set) var state: SubmissionState?
    
    
    func create(){
        // déclaration d'un JSONencoder pour transformer en json à envoyer
        let encoder  = JSONEncoder()
        let data = try? encoder.encode(newIngredient)
        NetworkingManager
            .shared
            .request(methodeType: .POST(data: data), url: "http://137.184.217.221/ingredients") { [weak self] res in
                DispatchQueue.main.async {
                    switch res {
                    case .success:
                        print("succes")
                        self?.state = .sucessful
                        break
                    case  .failure(let err):
                        print(err)
                        self?.state = .unsuccessful
                        break
                        
                        
                    }
                }
            }
        
    }
    
}
extension CreateIngredientViewModel {
    enum SubmissionState {
        case unsuccessful
        case sucessful
    }
}

