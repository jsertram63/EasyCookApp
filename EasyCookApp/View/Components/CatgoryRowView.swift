//
//  CatgoryRowView.swift
//  EasyCookApp
//
//  Created by Pierric Marye on 09/10/2022.
//

import SwiftUI

struct CatgoryRowView: View {
    var categoryName: String
    var recipes: [RecipeModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(Font.custom("Noteworthy", size: 20))
                .fontWeight(.medium)
                .foregroundColor(.accentColor)
            
            Divider()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 25.0) {
                    ForEach(recipes) { recipe in
                        NavigationLink {
                            RecipeDetailsView(recipe: recipe)
                        } label: {
                            VStack(alignment: .center, spacing: 10.0) {
                                AsyncImage(url: URL(string: recipe.imageURL)) { image in
                                    image
                                        .resizable()
                                        .frame(width: 150, height: 125)
                                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                                .stroke(Color.brown, lineWidth: 10)
                                        }
                                        .shadow(radius: 2)
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                Text(recipe.name)
                                    .foregroundColor(.accentColor)
                                    .fontWeight(.bold)
                                    .font(.caption)
                            }
                            .padding(.vertical)
                        }
                    }
                }
                .padding(.leading)
            }
        }
        .padding([.top, .leading, .bottom])
        .background(.thickMaterial)
    }
}
