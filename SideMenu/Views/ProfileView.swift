import SwiftUI

struct ProfileView: View {
    private var employee = ViewModel.default.profile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Profile")
                .font(.title)
                .bold()
                .padding(.vertical)
            
            HStack {
                Text("Name: ")
                Spacer()
                Text(employee.name)
                    .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .leading)
            }
            
            HStack {
                Text("Phone: ")
                Spacer()
                Text(employee.phone)
                    .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .leading)
            }
            
            HStack {
                Text("Email: ")
                Spacer()
                Text(employee.email)
                    .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .leading)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
