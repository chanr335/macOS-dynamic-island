import AppKit
import SwiftUI

//lifecycle of app
//Initialized as NSObject, but act like NSApplicationDelegate
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ : Notification) {
        guard let screen = NSScreen.main else { return }//cuz its an optional

        let screenWidth = screen.frame.width
        let screenHeight = screen.frame.height

        let panelHeight: CGFloat = 70
        let positionY = screenHeight - panelHeight + 5

        window = NSWindow(
            contentRect: NSRect(x: screenWidth / 2.675, y: positionY, width: screenWidth / 4, height: panelHeight),
            styleMask: .borderless,
            backing: .buffered,
            defer: false
        )

        window.level = .statusBar 
        window.backgroundColor = .clear

        let view = DynamicIslandView()
        let hosting = NSHostingView(rootView: view)//wraps View into NSView for NSWindow
        hosting.frame = NSRect(x: 0, y: 0, width: screenWidth, height: panelHeight)
        window.contentView = hosting //make NSWindow display the new NSHostingView
        window.makeKeyAndOrderFront(nil)
    }
}

