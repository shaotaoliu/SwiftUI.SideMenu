import SwiftUI

struct MenuView: View {
    @Binding var selectedMenuItem: SideMenuItem
    @StateObject var vm = ViewModel.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            MenuButton(selectedMenuItem: $selectedMenuItem,
                       menuItem: .home,
                       label: "Home",
                       systemImageName: "house")
            
            MenuButton(selectedMenuItem: $selectedMenuItem,
                       menuItem: .profile,
                       label: "Profile",
                       systemImageName: "person")
            
            MenuButton(selectedMenuItem: $selectedMenuItem,
                       menuItem: .settings,
                       label: "Settings",
                       systemImageName: "gear")
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 10)
        .padding(.top, 10)
        .background(vm.settings.menuBackgoundColor)
    }
    
    struct MenuButton: View {
        @Binding var selectedMenuItem: SideMenuItem
        let menuItem: SideMenuItem
        let label: String
        let systemImageName: String
        @StateObject var vm = ViewModel.default
        
        var body: some View {
            Button(action: {
                selectedMenuItem = menuItem
            }, label: {
                Label(label, systemImage: systemImageName)
            })
                .foregroundColor(selectedMenuItem == menuItem
                                 ? vm.settings.activeMenuForegroundColor
                                 : vm.settings.menuForegroundColor)
                .padding(6)
                .background(selectedMenuItem == menuItem
                            ? vm.settings.activeMenuBackgoundColor
                            : vm.settings.menuBackgoundColor)
                .cornerRadius(6)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(selectedMenuItem: .constant(SideMenuItem.home))
    }
}

enum SideMenuItem {
    case home
    case profile
    case settings
}
