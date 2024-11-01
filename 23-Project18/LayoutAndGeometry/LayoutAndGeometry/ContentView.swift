import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink]
    var body: some View {
        GeometryReader { fullView in        ScrollView {
            ForEach(0..<50) { index in
                GeometryReader { proxy in
                    Text("Row #\(index)")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .background(colors[index % 5])
                        .rotation3DEffect(
                            .degrees(proxy.frame(in: .global).minY  - fullView.size.height / 2) / 5,
                            axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                        )
                }
                .frame(height: 40)
            }
        }
        }
    }
}


#Preview {
    ContentView()
}
