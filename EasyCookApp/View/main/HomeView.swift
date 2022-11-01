//
//  HomeView.swift
//  EasyCookApp
//
//  Created by Pierric Marye on 15/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.presentationMode) var LoginMode
    @State var loginMode = false
    
    var body: some View {
        ZStack {
            Color.accentColor.opacity(0.25).ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: 50.0) {
                    VStack(alignment: .center) {
                        Image("cuisine")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 125.0, height: 125.0)
                            .shadow(radius: 5)
                        
                        Text("EasyCookApp")
                            .font(Font.custom("Noteworthy", size: 30))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.accentColor)
                            .multilineTextAlignment(.center)
                    }
                    
                    
                    VStack(spacing: 10.0) {
                        Text("Cette application est dédiée à toutes les personnes aimant la cuisine et partager un moment convivial autour de la table.")
                        
                        
                        Text("Qui ne s'est jamais posé la question... Que mange-t-on aujourd'hui ?")
                        
                        Text("Petit clin d'oeil aux femmes qui se la posent très souvent lorsque qu'après une journée bien remplie, il faut se mettre derrière les fourneaux...")
                        
                        Text("Au menu vous trouverez quelques recettes faciles à réaliser, classées selon les catégories apéritifs, plats et desserts.")
                        
                        Text("Commencez par vous connecter ou créez un compte afin de gérer vos recettes et ingrédient")
                        
                        Text("Bon appétit !")
                            .foregroundColor(Color.accentColor)
                            .fontWeight(.bold)
                            .padding(.top)
                        
                        Button {
                            loginMode = true
                            
                        } label: {
                            Text("connexion")
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                                .padding()
                                .background(.thickMaterial)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                            
                        }
                        .padding(.top, 20.0)
                    }
                }
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                .sheet(isPresented: $loginMode) {
                    LoginView()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
