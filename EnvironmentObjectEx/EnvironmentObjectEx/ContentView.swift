//
//  ContentView.swift
//  EnvironmentObjectEx
//
//  Created by Apple on 30/11/25.
//

import SwiftUI
import Combine

class CounterClass: ObservableObject {
    @Published var count: Int = 0
}

struct CounterView: View {
    
    @EnvironmentObject var counter: CounterClass
    
    var body: some View {
        VStack {
            Text("Count = \(counter.count)")
                .padding()
            Button(action: {
                counter.count += 1
            }, label: {
                Text("Counter")
            })
        }
    }
}

struct ContentView: View {
    var body: some View {
        CounterView()
            .environmentObject(CounterClass())
    }
}

struct ContentView_previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
