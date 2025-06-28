import SwiftUI

struct DynamicIslandView: View {
    @ObservedObject var state: SharedState
    @State private var showContent: Bool = false

    @State private var start: Bool = false 
    @State private var hour: Double = 0
    @State private var min: Double = 0
    @State private var sec: Double = 0
    @State private var hundredth: Double = 0
    @State private var timer: Timer? = nil

    @State private var input: String = ""

    @State private var content: Int = 1

    var body: some View {
        HStack {
            Spacer()
            ZStack (alignment: .leading){
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                    .frame(width: state.isWindowOpen ? 700 : 100, height: 37)
                    .onTapGesture {
                        withAnimation(.easeOut(duration: 0.3)) {
                            state.isWindowOpen.toggle()
                        }
                        if state.isWindowOpen{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                withAnimation(.easeOut(duration: 0.2)) {
                                    showContent = true
                                }
                            }
                        } else{
                            withAnimation(.easeOut(duration: 0.2)) {
                                showContent = false
                            }
                        }
                    }

                    .overlay(
                        Group{
                            if showContent{
                                if content == 1{
                                    StopwatchView(start: $start, hour: $hour, min: $min, sec: $sec, hundredth: $hundredth, timer: $timer, content: $content)
                                }
                                if content == 2{
                                    TimerView(start: $start, hour: $hour, min: $min, sec: $sec, hundredth: $hundredth, timer: $timer, content: $content, input: $input,)
                                }
                            }
                        }
                    )
            }
            Spacer()
        }
    }
}
