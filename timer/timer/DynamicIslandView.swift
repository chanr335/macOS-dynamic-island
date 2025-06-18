import SwiftUI

struct DynamicIslandView: View {
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.black)
                .frame(height: 40)
        }
    }
}

