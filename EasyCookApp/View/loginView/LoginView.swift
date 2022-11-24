//
//  LoginView.swift
//  EasyCookApp
//
//  Created by Lunack on 31/10/2022.
//

import SwiftUI

struct LoginView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.tintColor,
            .font : UIFont(name:"Noteworthy", size: 35)!
        ]
    }
    
    @Environment(\.dismiss) var dismiss
    
    @State var userName = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.color1.ignoresSafeArea()
                
                VStack {
                    VStack(alignment: .center, spacing: 15) {
                        
                        VStack(spacing: 25.0) {
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
                                print("connextion")
                                dismiss()
                            } label: {
                                Text("connexion")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(5.0)
                            }
                            .buttonStyle(.borderedProminent)
                            .shadow(radius: 3)
                            
                            Spacer()
                            
                            NavigationLink {
                                InscriptionView()
                            } label: {
                                Text("Inscription")
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
                .navigationTitle("Connexion")
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
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
