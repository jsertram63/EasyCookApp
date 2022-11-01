//
//  AddRecipeView.swift
//  EasyCookApp
//
//  Created by Pierric Marye on 09/10/2022.
//

import SwiftUI

struct AddRecipeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.brown,
            .font : UIFont(name:"Noteworthy", size: 30)!
        ]
    }
    
    
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    
    @StateObject private var vm = CreateRecipeViewModel()
    

    @State var categoryType:Int = 0
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 25.0) {
                    TextField("Nom de votre recette", text:$vm.newRec.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.words)
                        .padding(.horizontal)
                    
                    Picker("Quelle type de recette", selection: $categoryType) {
                                   Text("Entrée").tag(0)
                                   Text("Plat").tag(1)
                                   Text("Dessert").tag(2)
                               }
                               .pickerStyle(.segmented)
                    
                    TextField("Entrer votre description...", text: $vm.newRec.description, axis: .vertical)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.sentences)
                        .lineLimit(12, reservesSpace: true)
                        .padding(.horizontal)
                    
                    TextField("Lien internet photo", text: $vm.newRec.imageURL)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.words)
                        .padding(.horizontal)
                    Button {
                        print("envoyer")
                        switch categoryType {
                        case 0: vm.newRec.categorie = Category.appetizer.rawValue
                        case 1:vm.newRec.categorie = Category.dish.rawValue
                        case 2:vm.newRec.categorie = Category.dessert.rawValue
                        default:break
                        }
                        vm.create()
                        recipesVM.fetchRecipes()
                        
                    } label: {
                        Text("Envoyer")
                    }

                }
            }
            .padding()
             
            .background(Color.brown.opacity(0.25).ignoresSafeArea())
            .onChange(of: vm.state) { formState in
                if  formState == .sucessful {
                    presentationMode.wrappedValue.dismiss()
                    // on veut modifier quelque chose dans notre vue list d'ingrédients.
                }
            }
        }
    }
    
    struct AddRecipeView_Previews: PreviewProvider {
        static var previews: some View {
            AddRecipeView()
                .environmentObject(RecipesViewModel())
        }
    }
}
