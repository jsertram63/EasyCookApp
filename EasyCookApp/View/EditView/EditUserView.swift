//
//  UserModificationView.swift
//  EasyCookApp
//
//  Created by Pierric Marye on 09/10/2022.
//

import SwiftUI

struct EditUserView: View {
    
    var body: some View {
        ZStack {
            Color.accentColor.opacity(0.25).ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Text("Formulaire de modification de l'utilisateur")
                        .foregroundColor(Color.accentColor)
                }
                .padding()
            }
        }
    }
}

struct UserModificationView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserView()
    }
}
