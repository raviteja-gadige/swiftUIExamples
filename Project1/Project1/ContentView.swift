//
//  ContentView.swift
//  Project1
//
//  Created by Apple on 29/11/25.
//

import SwiftUI
import Combine


class CounterClass: ObservableObject {
    @Published var counter: Int = 0
}

struct ContentView: View {
    
    var body: some View {
        ChildView()
            .environmentObject(CounterClass())
    }
}

struct ChildView: View {
    
    @EnvironmentObject var counterClass:CounterClass
    
    var body: some View {
        VStack {
            Text("Count = \(counterClass.counter)")
                .padding()
            Button(action: {
                counterClass.counter += 1
            }, label: {
                Text("Counter")
            })
        }
    }
}

struct ContentView_previews : PreviewProvider {
    static var previews: some View  {
        ContentView()
    }
}
