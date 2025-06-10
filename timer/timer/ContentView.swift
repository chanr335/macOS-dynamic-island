//
//  ContentView.swift
//  timer
//
//  Created by Ryan Chan on 2025-06-05.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openWindow) private var openWindow
    @State private var start: Bool = false 


    @State private var hour: Double = 0
    @State private var min: Double = 0
    @State private var sec: Double = 0

    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack{
            Text("\(sec)")
                .contentTransition(.numericText(value: sec))
                .font(.largeTitle)
                .padding()
            
            HStack{
                Button("Start"){
                    if !start{
                        start = true
                        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ _ in
                            sec += 1
                        }
                    }
                }
                
                Button("Stop"){
                    start = false
                    timer?.invalidate()
                }
                
                Button("Reset"){
                    start = false
                    timer?.invalidate()
                    sec = 0
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
