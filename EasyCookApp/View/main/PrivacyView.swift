//
//  PrivacyView.swift
//  EasyCookApp
//
//  Created by Pierric Marye on 15/10/2022.
//

import SwiftUI

struct PrivacyView: View {
    var body: some View {
        ZStack {
            Color.accentColor.opacity(0.25).ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: 45) {
                    Spacer()
                    
                    Image("cuisine")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100.0, height: 100.0)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    
                    // Original Editing Text
                    VStack(spacing: 5) {
                        Text("Édition originale:")
                            .fontWeight(.bold)
                        Text("EasyCookApp")
                        .padding(/*@START_MENU_TOKEN@*/.all, 1.0/*@END_MENU_TOKEN@*/)
                    }
                    // Editing by Text
                    VStack(spacing: 5) {
                        Text("Remerciements:")
                            .fontWeight(.bold)
                        Text("Ghislaine Marye qui a réalisé les recettes, les textes et photos.")
                            .multilineTextAlignment(.center)
                    }
                    // Publishing text
                    VStack(spacing: 5) {
                        Text("Publiée par:")
                            .fontWeight(.bold)
                        Text("Pierric Marye")
                            .multilineTextAlignment(.center)
                    }
                    
                    Link(destination: URL(string: "https://www.studi.com/fr")!) {
                        Text("Studi 🌐")
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                            .padding(10.0)
                            .background(.regularMaterial)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.5), radius: 5, x: 2, y: 2)
                    }
                    // Copyright text
                    VStack(spacing: 5) {
                        Text("© 2022 Tous droits réservés.")
                            .fontWeight(.medium)
                        Text("Aucune partie du contenu de cette application ne peut être reproduite, transmise ou modifiée sans l'autorisation au préalable de l'éditeur.")
                            .multilineTextAlignment(.center)
                    }
                    
                    Image("rosemary")
                        .resizable()
                        .frame(width: 75.0, height: 75.0)
                        .shadow(radius: 10)
                }
                .foregroundColor(.black)
                .padding(.horizontal)
            }
        }
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
