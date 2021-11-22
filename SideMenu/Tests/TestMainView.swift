import SwiftUI

struct TestMainView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        Button("Show Menu") {
            withAnimation {
                showMenu = true
            }
        }
    }
}

struct TestMainView_Previews: PreviewProvider {
    static var previews: some View {
        TestMainView(showMenu: .constant(true))
    }
}
