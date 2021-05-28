//
//  Publisher+Extension.swift
//  pager
//
//  Created by Aleksandr Sidorov on 28.05.2021.
//

import Combine
import SwiftUI

extension Publisher {
    func trackActivity(_ isLoading: Binding<Bool>?) -> Publishers.HandleEvents<Self> {
        handleEvents(
            receiveSubscription: { _ in isLoading?.wrappedValue = true },
            receiveCompletion: { _ in isLoading?.wrappedValue = false },
            receiveCancel: { isLoading?.wrappedValue = false })
    }
}
