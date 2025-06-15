//
//  timerApp.swift
//  timer
//
//  Created by Ryan Chan on 2025-06-05.
//

import SwiftUI
import AppKit

@main
struct TimerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {} 
    }
}
