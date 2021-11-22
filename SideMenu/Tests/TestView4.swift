import SwiftUI

struct TestView4: View {
    private let topOffset: CGFloat = 100
    private let bottomOffset: CGFloat = 100
    @State private var dragOffset: CGFloat = 0
    @State private var height: CGFloat = 0
    @State private var atTop = true
    
    var body: some View {
        ZStack {
            Text("Hello World")
                .font(.title)
            
            Rectangle()
                .fill(.blue)
                .cornerRadius(20)
                .offset(y: topOffset + dragOffset + height)
                .gesture(dragGesture)
            .ignoresSafeArea()
        }
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged {
                dragOffset = $0.translation.height
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    if atTop {
                        if value.translation.height > UIScreen.main.bounds.height / 3 {
                            height = UIScreen.main.bounds.height - topOffset - bottomOffset
                        }
                    }
                    else {
                        if (value.translation.height < -UIScreen.main.bounds.height / 3) {
                            height = 0
                        }
                    }
                    
                    dragOffset = 0
                    atTop.toggle()
                }
            }
    }
}

struct TestView4_Previews: PreviewProvider {
    static var previews: some View {
        TestView4()
    }
}
