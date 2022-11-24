//
//  CatgoryRowView.swift
//  EasyCookApp
//
//  Created by Pierric Marye on 09/10/2022.
//

import SwiftUI

struct CategoryRowView: View {
    var categoryName: String
    var recipes: [RecipeModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(Font.custom("Noteworthy", size: 20))
                .fontWeight(.regular)
                .foregroundColor(.accentColor)
            
            Divider()
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 30.0) {
                    ForEach(recipes) { recipe in
                        NavigationLink {
                            RecipeDetailsView(recipe: recipe)
                        } label: {
                            VStack(alignment: .center, spacing: 15.0) {
                                AsyncImage(url: URL(string: recipe.imageURL)) { image in
                                    image
                                        .resizable()
                                        .frame(width: 150, height: 105)
                                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                                .stroke(Color.brown, lineWidth: 7)
                                        }
                                        .shadow(radius: 2)
                                    
                                } placeholder: {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 150, height: 105)
                                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                                .stroke(Color.brown, lineWidth: 7)
                                        }
                                        .foregroundColor(Color.color2)
                                        .shadow(radius: 2)
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
                .padding(.horizontal)
            }
        }
        .padding([.top, .leading])
    }
}
