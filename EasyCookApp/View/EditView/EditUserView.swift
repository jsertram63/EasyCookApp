//
//  UserModificationView.swift
//  EasyCookApp
//
//  Created by Pierric Marye on 09/10/2022.
//

import SwiftUI

struct EditUserView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.tintColor,
            .font : UIFont(name:"Noteworthy", size: 35)!
        ]
    }
    
    @Environment(\.dismiss) var dismiss
    
    @State var fullName = ""
    @State var userName = ""
    @State var password = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.color1.ignoresSafeArea()
                
                VStack {
                    VStack(alignment: .center, spacing: 15) {
                        
                        VStack(spacing: 25.0) {
                            VStack(alignment: .leading, spacing: 5.0) {
                                Text("Nom et prénom")
                                    .foregroundColor(Color.accentColor)
                                
                                TextField("", text: $userName)
                                    .padding(5.0)
                                    .background(.white)
                                    .foregroundColor(.black)
                                    .textInputAutocapitalization(.words)
                            }
                            
                            VStack(alignment: .leading, spacing: 5.0) {
                                Text("Pseudo")
                                    .foregroundColor(Color.accentColor)
                                
                                TextField("", text: $userName)
                                    .padding(5.0)
                                    .background(.white)
                                    .foregroundColor(.black)
                                    .textInputAutocapitalization(.words)
                            }
                            
                            VStack(alignment: .leading, spacing: 5.0) {
                                Text("Mot de passe")
                                    .foregroundColor(Color.accentColor)
                                
                                SecureField("", text: $password)
                                    .padding(5.0)
                                    .background(.white)
                                    .foregroundColor(.black)
                            }
                        }
                        
                        HStack(alignment: .center) {
                            Button {
                                print("Valider")
                                dismiss()
                            } label: {
                                Text("Valider")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(5.0)
                            }
                            .buttonStyle(.borderedProminent)
                            .shadow(radius: 3)
                            
                            Spacer()
                            
                            Button {
                                dismiss()
                            } label: {
                                Text("Annuler")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(5.0)
                            }
                            .buttonStyle(.borderedProminent)
                            .shadow(radius: 3)
                        }
                        .padding(.vertical)
                    }
                }
                .padding(.horizontal, 50.0)
                .navigationTitle("Espace utilisateur")
            }
        }
    }
}

struct UserModificationView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserView()
    }
}
