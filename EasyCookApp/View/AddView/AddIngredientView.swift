//
//  AddIngredientView.swift
//  EasyCookApp
//
//  Created by Pierric Marye on 09/10/2022.
//

import SwiftUI

struct AddIngredientView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    
    
    @StateObject private var vm = CreateIngredientViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.brown,
            .font : UIFont(name:"Noteworthy", size: 30)!
        ]
    }
    
    @State var nomIngredient = ""
    
    var body: some View {
        NavigationView {

                VStack(alignment: .center, spacing: 25.0) {
                    TextField("Nom de l'ingrédient ", text:$vm.newIngredient.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.words)
                        .padding(.horizontal)
                    Spacer()
                    Button {
                        print("création ingrédient")
                        vm.create()
                        recipesVM.fetchIngredients()
                        
                        
                    } label: {
                        Text("Envoyer")
                        
                       
                    }

                    
                }
                .padding()
            
                .background(Color.brown.opacity(0.25).ignoresSafeArea())
                .onChange(of: vm.state) { formState in
                    if  formState == .sucessful {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
               
                 


            }
        
        .padding()
         
        .background(Color.brown.opacity(0.25).ignoresSafeArea())
    }
}

struct AddIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        AddIngredientView()
    }
}
