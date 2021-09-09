//
//  AppStore.swift
//  SwiftUI_Redux_tutorial
//
//  Created by Jeff Jeong on 2021/02/21.
//

import Foundation

final class Store<State, Action>: ObservableObject {
    
    @Published private(set) var state: State
    
    private let reducer: (inout State, Action) -> Void
    
    init(state: State, reducer: @escaping (inout State, Action) -> Void ) {
        self.state = state
        self.reducer = reducer
    }
    
    func dispatch(action: Action) {
        reducer(&self.state, action)
    }
}

struct AppState {
    var currentDice: String = ""
}

enum AppAction: String {
    case rollTheDice
}





func appReducer(_ state: inout AppState, _ action: AppAction) -> Void {
    
    switch action {
    case .rollTheDice:
        state.currentDice = ["⚀","⚁","⚂","⚃","⚄","⚅"].randomElement() ?? "⚀"
    }
}
