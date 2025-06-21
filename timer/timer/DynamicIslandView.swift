import SwiftUI

struct DynamicIslandView: View {
    @ObservedObject var state: SharedState

    @State var start: Bool = false 
    @State var hour: Double = 0
    @State var min: Double = 0
    @State var sec: Double = 0
    @State var hundredth: Double = 0
    @State var timer: Timer? = nil

    var body: some View {
        HStack {
            Spacer(minLength: 0)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                    .frame(width: state.isWindowOpen ? 600 : 100, height: 37)
                    .animation(.easeInOut(duration: 0.5), value: state.isWindowOpen)
                    .onTapGesture {
                        state.isWindowOpen.toggle()
                    }

                if state.isWindowOpen {
                    // Your expanded content here
                }
            }
            Spacer(minLength: 0)
        }
    }
}
