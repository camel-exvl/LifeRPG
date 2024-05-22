//
//  MainView.swift
//  LifeRPG
//
//  Created by zjucvglab509 on 2024/5/22.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Hello, World!")
                .tabItem {
                    Label("targetTab", systemImage: "list.bullet")
                }
            
            Text("Hello, World!")
                .tabItem {
                    Label("exampleTab", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    MainView()
}
