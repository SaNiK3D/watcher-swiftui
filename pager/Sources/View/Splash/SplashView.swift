//
//  SplashView.swift
//  pager
//
//  Created by Aleksandr Sidorov on 28.05.2021.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Spacer()
            Image.watcherLogo
            Image.rmrLogo
            Spacer()
            Image.launchScreenImage
                .interpolation(.none)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
