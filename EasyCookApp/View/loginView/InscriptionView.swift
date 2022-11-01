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
            VStack {
                VStack(alignment: .center, spacing: 15) {
                    Text("Inscription")
                    TextField("Nom et prénom", text:$fullName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.words)
                        .padding(.horizontal)
                    TextField("Nom d'utilisateur", text:$userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.words)
                        .padding(.horizontal)
                    SecureField("Mot de passe", text:$password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    Button {
                        print("Inscription")
                    } label: {
                        Text("Valider")
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                            .padding()
                            .background(.thickMaterial)
                            .cornerRadius(15)
                            .shadow(radius: 5)
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

struct InscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        InscriptionView()
    }
}
