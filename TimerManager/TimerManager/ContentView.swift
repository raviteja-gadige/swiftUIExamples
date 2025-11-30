//
//  ContentView.swift
//  TimerManager
//
//  Created by Apple on 30/11/25.
//

import SwiftUI
import Combine

class TimerManager:ObservableObject {
    
    @Published var timerCount = 0
    private var timer = Timer()
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.timerCount += 1
        })
    }
    
    func stopTimer() {
        resetTimer()
        timer.invalidate()
    }
    
    func resetTimer() {
        timerCount = 0
    }
    
}
struct ContentView: View {
    
    @StateObject var timerManager = TimerManager()
    
    var body: some View {
        VStack {
            Text("Timer = \(timerManager.timerCount)")
                .font(Font.largeTitle)
                .padding()
            Button(action: {
                print("Start Timer")
                timerManager.startTimer()
                
            }, label: {
                Text("Start")
            })
            .padding()
            Button(action: {
                print("Stop Timer")
                timerManager.stopTimer()
            }, label: {
                Text("Stop")
            })
        }
    }
}


struct ContentView_previews : PreviewProvider {
    static var previews: some View  {
        ContentView()
    }
}
