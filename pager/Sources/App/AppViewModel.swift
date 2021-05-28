//
//  AppViewModel.swift
//  pager
//
//  Created by Aleksandr Sidorov on 28.05.2021.
//

import Combine

class AppViewModel: ObservableObject {
    @Published private(set) var isLogged = false
    @Published private(set) var isSplashShowing = true
    
    private let authTokenStorage: AuthTokenStorage
    
    init(authTokenStorage: AuthTokenStorage = ServiceLayer.shared.tokenStorage) {
        self.authTokenStorage = authTokenStorage
        try? authTokenStorage.removeToken()
    }
    
    func updateLoggedStatus() {
        isLogged = authTokenStorage.isTokenExists()
        isSplashShowing = false
    }
}
