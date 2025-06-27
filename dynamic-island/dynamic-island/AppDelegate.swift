import AppKit
import SwiftUI

class SharedState: ObservableObject {
    @Published var isWindowOpen: Bool = false
}

struct IslandLayout {
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    let openWidth: CGFloat = 600
    let height: CGFloat = 70

    init(screen: NSScreen) {
        self.screenWidth = screen.frame.width
        self.screenHeight = screen.frame.height
    }

    var openOriginX: CGFloat { centerX - (openWidth / 2) }
    var centerX: CGFloat {screenWidth / 2}
    var positionY: CGFloat {screenHeight - height + 5}
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    let windowState = SharedState()

    func applicationDidFinishLaunching(_: Notification) {
        guard let screen = NSScreen.main else { return }
        let layout = IslandLayout(screen: screen)

        window = NSWindow(
            contentRect: NSRect(
                x: layout.openOriginX,
                y: layout.positionY,
                width: layout.openWidth,
                height: layout.height
            ),
            styleMask: .borderless,
            backing: .buffered,
            defer: false
        )

        window.level = .statusBar
        window.backgroundColor = .clear

        let view = DynamicIslandView(state: windowState)
        let hosting = NSHostingView(rootView: view)
        hosting.frame = NSRect(x: 0, y: 0, width: layout.openWidth, height: layout.height)

        window.contentView = hosting
        window.makeKeyAndOrderFront(nil)
    }
}
