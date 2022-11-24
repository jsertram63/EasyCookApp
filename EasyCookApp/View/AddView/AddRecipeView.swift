//
//  AddRecipeView.swift
//  EasyCookApp
//
//  Created by Pierric Marye on 09/10/2022.
//

import SwiftUI

struct AddRecipeView: View {
    
    @Environment(\.dismiss) var dismiss
    
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
        NavigationStack {
            ZStack {
                Color.color1.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 25.0) {
                        VStack(alignment: .leading, spacing: 5.0) {
                            Text("Nom de votre recette")
                                .foregroundColor(Color.accentColor)
                            
                            TextField("", text:$vm.newRec.name)
                                .padding(5.0)
                                .background(.white)
                                .foregroundColor(.black)
                                .textInputAutocapitalization(.words)
                        }
                        
                        VStack(alignment: .leading, spacing: 5.0) {
                            Text("Choisir une catégorie")
                                .foregroundColor(Color.accentColor)
                            
                            Picker("", selection: $categoryType) {
                                Text("Entrée")
                                    .tag(0)
                                Text("Plat").tag(1)
                                Text("Dessert").tag(2)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        
                        VStack(alignment: .leading, spacing: 5.0) {
                            Text("Votre description")
                                .foregroundColor(Color.accentColor)
                            
                            TextField("", text: $vm.newRec.description, axis: .vertical)
                                .background(.white)
                                .foregroundColor(.black)
                                .textInputAutocapitalization(.sentences)
                                .lineLimit(12, reservesSpace: true)
                        }
                        
                        VStack(alignment: .leading, spacing: 5.0) {
                            Text("Choisir une image")
                                .foregroundColor(Color.accentColor)
                            
                            TextField("", text: $vm.newRec.imageURL)
                                .padding(5.0)
                                .background(.white)
                                .foregroundColor(.black)
                        }
                        
                        Button {
                            print("Valider")
                            
                            switch categoryType {
                            case 0: vm.newRec.categorie = Category.appetizer.rawValue
                            case 1:vm.newRec.categorie = Category.dish.rawValue
                            case 2:vm.newRec.categorie = Category.dessert.rawValue
                            default:break
                            }
                            
                            vm.create()
                            recipesVM.fetchRecipes()
                            dismiss()
                        } label: {
                            Text("Valider")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(5.0)
                        }
                        .buttonStyle(.borderedProminent)
                        .shadow(radius: 3)
                    }
                    .padding(20)
                    .navigationTitle("Ajouter votre recette")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                withAnimation {
                                    dismiss()
                                }
                            } label: {
                                Image(systemName: "xmark.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .onChange(of: vm.state) { formState in
                        if formState == .sucessful {
                            dismiss()
                            // on veut modifier quelque chose dans notre vue list d'ingrédients.
                        }
                    }
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
