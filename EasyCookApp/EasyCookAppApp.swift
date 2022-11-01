//
//  EasyCookAppApp.swift
//  EasyCookApp
//
//  Created by Lunack on 03/10/2022.
//

import SwiftUI

@main
struct EasyCookAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(RecipesViewModel())
                .environmentObject(CreateRecipeViewModel())
                .environmentObject(CreateIngredientViewModel())
        }
    }
}
