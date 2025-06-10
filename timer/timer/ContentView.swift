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
    @State private var hundredth: Double = 0

    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack{
            Text(String(format:"%02.0f:%02.0f:%02.0f:%02.0f", hour, min, sec, hundredth))
                .font(.largeTitle)
                .padding()
            
            HStack{
                Button("Start"){
                    if !start{
                        start = true
                        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){ _ in
                            hundredth += 1
                            if hundredth == 100{
                                sec += 1
                                hundredth = 0
                            }
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

                    hour = 0
                    min = 0
                    sec = 0
                    hundredth = 0
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
