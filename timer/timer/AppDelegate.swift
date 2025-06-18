import AppKit
import SwiftUI

class DynamicIslandWindow: NSWindow {
    var isWindowOpen: Bool = false

    override func sendEvent(_ event: NSEvent) {
        if event.type == .leftMouseDown {
            guard let screen = NSScreen.main else { return }  //cuz its an optional

            let screenWidth = screen.frame.width
            let screenHeight = screen.frame.height

            let panelHeight: CGFloat = 70
            let panelWidth = screenWidth / 4
            let positionX = (screenWidth - panelWidth) / 2
            let positionY = screenHeight - panelHeight + 5

            isWindowOpen.toggle()

            let width = isWindowOpen ? screenWidth / 4 : screenWidth / 10
            let x = isWindowOpen ? positionX : positionX + positionX / 5

            self.setFrame(
                NSRect(x: x, y: positionY, width: width, height: panelHeight),
                display: true,
                animate: true
            )
        }
    }
}

//lifecycle of app
//Initialized as NSObject, but act like NSApplicationDelegate
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: DynamicIslandWindow!

    func applicationDidFinishLaunching(_: Notification) {
        guard let screen = NSScreen.main else { return }  //cuz its an optional

        let screenWidth = screen.frame.width
        let screenHeight = screen.frame.height

        let panelHeight: CGFloat = 70
        let panelWidth = screenWidth / 4
        let positionX = (screenWidth - panelWidth) / 2
        let positionY = screenHeight - panelHeight + 5

        window = DynamicIslandWindow(
            contentRect: NSRect(
                x: positionX + positionX / 5,
                y: positionY,
                width: screenWidth / 10,
                height: panelHeight
            ),
            styleMask: .borderless,
            backing: .buffered,
            defer: false
        )

        window.level = .statusBar
        window.backgroundColor = .clear

        let view = DynamicIslandView()
        let hosting = NSHostingView(rootView: view)  //wraps View into NSView for NSWindow
        hosting.frame = NSRect(
            x: 0,
            y: 0,
            width: screenWidth,
            height: panelHeight
        )
        window.contentView = hosting  //make NSWindow display the new NSHostingView
        window.makeKeyAndOrderFront(nil)
    }
}
