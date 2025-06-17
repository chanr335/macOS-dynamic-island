import SwiftUI

struct DynamicIslandView: View {
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.blue)
                .frame(height: 40)
                .padding(.horizontal, 10)
        }
    }
}

