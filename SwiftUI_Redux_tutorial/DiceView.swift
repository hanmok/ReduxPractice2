
import Foundation
import SwiftUI

struct DiceView: View {
    
    @EnvironmentObject var store : Store<AppState, AppAction>
    
    @State private var pressed = false
    
    func rollTheDice(){
      
        self.store.dispatch(action: .rollTheDice)
    }
    
    var body: some View{
        VStack{
            Text(self.store.state.currentDice)
             
            Button(action: {
                self.rollTheDice()
            }, label: {
                Text("랜덤 주사위 굴리기")                   
            })

            .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
                withAnimation(.easeInOut(duration: 0.2), {
                    self.pressed = pressing
                })
            }, perform: {})
        }
    }
}


struct ContentView: View {
    
    let store = Store<AppState, AppAction> (state: AppState.init(currentDice: "⚀"), reducer: appReducer(_:_:))
    
    var body: some View {
        DiceView().environmentObject(store)
    }
}
