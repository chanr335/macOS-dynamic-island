import SwiftUI

struct StopwatchView: View{
    @Binding var start: Bool
    @Binding var hour: Double
    @Binding var min: Double
    @Binding var sec: Double
    @Binding var hundredth: Double
    @Binding var timer: Timer?

    var body: some View{
        HStack{
            Text(String(format:"%02.0f:%02.0f:%02.0f:%02.0f", hour, min, sec, hundredth))
                .font(.largeTitle)
                .padding(.leading, 20)
                .foregroundColor(Color.white)

            Spacer()
            Button("Start"){
                if !start{
                    start = true
                    timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){ _ in
                        hundredth += 1
                        if hundredth == 100 {
                            sec += 1
                                hundredth = 0
                        }
                        if sec == 60 {
                            min += 1
                                sec = 0
                        }
                        if min == 60{
                            hour += 1
                                min = 0
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
        .padding(.trailing, 10)
        }
    }
}
