//
//  OnboardingView.swift
//  LifeRPG
//
//  Created by zjucvglab509 on 2024/5/22.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        Button(action: {
            // 在这里添加你的操作代码
        }) {
            Text("你好，世界！")
                .font(.custom("Fusion-Pixel-12px-Proportional-zh_hant-Regular", size: 20))
        }
        .accentColor(.accentColor)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
