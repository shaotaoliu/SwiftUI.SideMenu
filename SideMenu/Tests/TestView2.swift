import SwiftUI

struct TestView2: View {
    private let offset: CGFloat = 100
    @State private var dragOffset: CGFloat = 0
    
    var body: some View {
        Rectangle()
            .fill(.blue)
            .cornerRadius(20)
            .offset(y: offset + dragOffset)
            .gesture(dragGesture)
            .edgesIgnoringSafeArea(.all)
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged {
                dragOffset = $0.translation.height
            }
            .onEnded { _ in
                withAnimation(.spring()) {
                    dragOffset = 0
                }
            }
    }
}

struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2()
    }
}
