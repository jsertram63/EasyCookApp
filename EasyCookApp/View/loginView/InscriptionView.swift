//
//  InscriptionView.swift
//  EasyCookApp
//
//  Created by Lunack on 31/10/2022.
//

import SwiftUI

struct InscriptionView: View {
    
    @State var userName = ""
    @State var password = ""
    @State var fullName = ""
    
    var body: some View {
        ZStack {
            Color.brown.opacity(0.25).ignoresSafeArea()
            
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
                        
                        HStack {
                            Button {
                                print("Valider")
                            } label: {
                                Text("S'inscrire")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(5.0)
                            }
                            .buttonStyle(.borderedProminent)
                            .shadow(radius: 3)
                            
                            Spacer()
                        }
                        .padding(.top)
                    }
                }
                .padding(.horizontal, 50.0)
            }
        }
    }
}

struct InscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        InscriptionView()
    }
}
