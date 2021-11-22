import SwiftUI

struct MainView: View {
    @Binding var showMenu: Bool
    var selectedMenuItem: SideMenuItem
    
    var body: some View {
        VStack {
            switch selectedMenuItem {
            case .home:
                HomeView()
                
            case .profile:
                ProfileView()
                
            case .settings:
                SettingsView()
            }
            
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(showMenu: .constant(true), selectedMenuItem: SideMenuItem.profile)
    }
}
