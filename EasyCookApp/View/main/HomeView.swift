//
//  HomeView.swift
//  EasyCookApp
//
//  Created by Pierric Marye on 15/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showLoginView = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 50.0) {
                VStack(alignment: .center, spacing: 5.0) {
                    Image("cuisine")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 125.0, height: 125.0)
                        .shadow(radius: 5)
                    
                    Text("EasyCookApp")
                        .font(Font.custom("Noteworthy", size: 30))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.accentColor)
                }
                
                
                VStack(spacing: 10.0) {
                    Text("Cette application est dédiée à toutes les personnes aimant la cuisine et partager un moment convivial autour de la table.")
                    
                    
                    Text("Qui ne s'est jamais posé la question... Que mange-t-on aujourd'hui ?")
                    
                    Text("Au menu vous trouverez quelques recettes faciles à réaliser, classées selon les catégories apéritifs, plats et desserts.")
                    
                    Text("Commencez par vous connecter ou créez un compte afin de pouver créer et gérer vos recettes et ingrédients")
                    
                    Text("Bon appétit !")
                        .foregroundColor(Color.accentColor)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    
                    Button {
                        showLoginView.toggle()
                        
                    } label: {
                        Text("connexion")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(5.0)
                    }
                    .padding(.vertical)
                    .buttonStyle(.borderedProminent)
                    .shadow(radius: 3)
                }
                .multilineTextAlignment(.center)
            }
            .foregroundColor(.black)
            .padding([.top, .leading, .trailing], 30.0)
        }
        .fullScreenCover(isPresented: $showLoginView) {
            LoginView()
        }
        .background(Color.color1)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
