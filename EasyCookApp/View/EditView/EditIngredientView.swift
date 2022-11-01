//
//  EditIngredientView.swift
//  EasyCookApp
//
//  Created by Pierric Marye on 09/10/2022.
//

import SwiftUI

struct EditIngredientView: View {
    var body: some View {
        ZStack {
            Color.accentColor.opacity(0.25).ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Text("Formulaire d'édition d'un ingrédient")
                        .foregroundColor(Color.accentColor)
                }
                .padding()
            }
        }
    }
}

struct EditIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        EditIngredientView()
    }
}
