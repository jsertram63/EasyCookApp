//
//  LoginView.swift
//  EasyCookApp
//
//  Created by Lunack on 31/10/2022.
//

import SwiftUI

struct LoginView: View {
    @State var userName = ""
    @State var password = ""
    var body: some View {
        NavigationView{
            ZStack {
                Color.brown.opacity(0.25).ignoresSafeArea()
                VStack {
                    VStack(alignment: .center, spacing: 15) {
                        Text("Easy Cook App")
                        TextField("Nom d'utilisateur", text:$userName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textInputAutocapitalization(.words)
                            .padding(.horizontal)
                        SecureField("Mot de passe", text:$password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        HStack(alignment: .center) {
                            Button {
                                print("connextion")
                            } label: {
                                Text("connexion")
                                    .fontWeight(.bold)
                                    .foregroundColor(.accentColor)
                                    .padding()
                                    .background(.thickMaterial)
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                            }
                            Spacer()
                            NavigationLink {
                                InscriptionView()
                            } label: {
                                Text("Inscription")
                                    .fontWeight(.bold)
                                    .foregroundColor(.accentColor)
                                    .padding()
                                    .background(.thickMaterial)
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                            }

                        }

                        
                    }
                    .padding()
                    .background(.ultraThinMaterial).cornerRadius(15)
                    .shadow(radius: 5)
                 
                }
                .padding()
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
