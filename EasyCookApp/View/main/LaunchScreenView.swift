//
//  LaunchScreenView.swift
//  EasyCookApp
//
//  Created by Pierric Marye on 24/11/2022.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var isActive = false
    @State private var size = 0.1
    @State private var opacity = 0.1
    
    var body: some View {
        if isActive {
            withAnimation {
                ContentView()
            }
        } else {
            ZStack {
                Color.color1.ignoresSafeArea()
                
                VStack {
                    VStack(alignment: .center, spacing: 5.0) {
                        Image("cuisine")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 300)
                        
                        Text("EasyCookApp")
                            .font(.custom("noteworthy", size: 35))
                            .fontWeight(.heavy)
                            .foregroundColor(.accentColor)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 2.5)) {
                            self.size = 1.0
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
