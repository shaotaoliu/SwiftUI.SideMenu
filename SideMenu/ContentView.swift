import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var selectedMenuItem = SideMenuItem.home
    @State private var offset: CGFloat = 0
    @State private var dragOffset: CGFloat = 0
    private let menuWidth = UIScreen.main.bounds.width / 2.7
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                MainView(showMenu: $showMenu, selectedMenuItem: selectedMenuItem)
                    .frame(width: UIScreen.main.bounds.width)
                    .offset(x: offset + dragOffset)
                    .disabled(showMenu ? true : false)
                
                MenuView(selectedMenuItem: $selectedMenuItem)
                    .frame(width: menuWidth)
                    .offset(x: offset - menuWidth + dragOffset)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: (
                Button(action: {
                    showMenu.toggle()
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            ))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        // only move to the left
                        if value.translation.width < 0 {
                            dragOffset = value.translation.width
                        }
                    }
                    .onEnded {
                        if $0.translation.width < -menuWidth / 3 {
                            showMenu = false
                            offset += dragOffset
                            dragOffset = 0
                        }
                        else {
                            showMenu = true
                            dragOffset = 0
                        }
                    })
            .onChange(of: showMenu, perform: { _ in
                withAnimation {
                    offset = showMenu ? menuWidth : 0
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
