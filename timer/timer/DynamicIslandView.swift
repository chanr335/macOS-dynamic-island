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
            ZStack (alignment: .leading){
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                    .frame(width: state.isWindowOpen ? 600 : 100, height: 37)
                    .animation(.easeInOut(duration: 0.3), value: state.isWindowOpen)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            state.isWindowOpen.toggle()
                        }
                    }


                if state.isWindowOpen {
                    HStack{
                        Text(String(format:"%02.0f:%02.0f:%02.0f:%02.0f", hour, min, sec, hundredth))
                            .font(.largeTitle)
                            .transition(.opacity)
                            .padding(.leading, 20)

                        Spacer()

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
                        }.padding(.trailing, 10)
                    }
                }
            }
            Spacer(minLength: 0)
        }
    }
}
