import SwiftUI

//lifecycle of app
struct IslandView: View{
    var body: some View{
        Button("Show Panel"){
            showPanel()
        }
    }

    func showPanel(){
        let panelWidth: CGFloat = 200
        let panelHeight: CGFloat = 200

        if let screenFrame = NSScreen.main?.frame{
            let x = (screenFrame.width - panelWidth) / 2
            let y = (screenFrame.height - panelHeight) / 2

            let panel = NSPanel(
                contentRect: NSRect(x: x, y: y, width: panelWidth, height: panelHeight),
                styleMask: [.resizable],
                backing: NSWindow.BackingStoreType.buffered,
                defer: false
            )
            panel.isFloatingPanel = true
            panel.level = .floating
            panel.makeKeyAndOrderFront(nil)
        }
    }
}
