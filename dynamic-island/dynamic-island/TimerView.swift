import SwiftUI

struct TimerView: View{
    @Binding var start: Bool
    @Binding var hour: Double
    @Binding var min: Double
    @Binding var sec: Double
    @Binding var hundredth: Double
    @Binding var timer: Timer?
    @Binding var content: Int

    @Binding var input: String 

    var body: some View{
        HStack{

            if !start{
                HStack(spacing: 1) {
                    TextField("", value: $hour, formatter: NumberFormatter())
                        .frame(width: 40)
                        .multilineTextAlignment(.center)
                    
                    Text(":")
                        .frame(width: 5)
                    
                    TextField("", value: $min, formatter: NumberFormatter())
                        .frame(width: 40)
                        .multilineTextAlignment(.center)
                    
                    Text(":")
                        .frame(width: 5)
                    
                    TextField("", value: $sec, formatter: NumberFormatter())
                        .frame(width: 40)
                        .multilineTextAlignment(.center)
                    
                    Text(":")
                        .frame(width: 5)
                    
                    TextField("", value: $hundredth, formatter: NumberFormatter())
                        .frame(width: 40)
                        .multilineTextAlignment(.center)
                }
                .font(.largeTitle)
                .padding(.leading, 20)
                .foregroundColor(.white)
                .textFieldStyle(PlainTextFieldStyle())
            }
            else{
                Text(String(format:"%02.0f:%02.0f:%02.0f:%02.0f", hour, min, sec, hundredth))
                    .font(.largeTitle)
                    .padding(.leading, 20)
                    .foregroundColor(Color.white)
            }

            Spacer()

            Button("Stopwatch"){
                start = false
                content = 1
                hour = 0
                min = 0
                sec = 0
                hundredth = 0
            }

            Button("Start") {
                if hour == 0 && min == 0 && sec == 0 && hundredth == 0 {
                    start = false
                }
                if !start {
                    start = true
                    timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                        if hundredth > 0 {
                            hundredth -= 1
                        } else if sec > 0 {
                            sec -= 1
                            hundredth = 99
                        } else if min > 0 {
                            min -= 1
                            sec = 59
                            hundredth = 99
                        } else if hour > 0 {
                            hour -= 1
                            min = 59
                            sec = 59
                            hundredth = 99
                        } else {
                            start = false
                            timer?.invalidate()
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
