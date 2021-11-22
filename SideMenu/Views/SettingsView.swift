import SwiftUI

struct SettingsView: View {
    @StateObject var vm = ViewModel.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Settings")
                .font(.title)
                .bold()
                .padding(.vertical)
            
            Form {
                ColorPicker("Menu Foreground Color", selection: $vm.settings.menuForegroundColor)
                ColorPicker("Menu Background Color", selection: $vm.settings.menuBackgoundColor)
                ColorPicker("Active Menu Foreground Color", selection: $vm.settings.activeMenuForegroundColor)
                ColorPicker("Active Menu Background Color", selection: $vm.settings.activeMenuBackgoundColor)
            }
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
