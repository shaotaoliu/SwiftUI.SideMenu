import SwiftUI

struct TestMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "house")
                    .foregroundColor(.gray)
                    .imageScale(.medium)
                
                Text("Home")
                    .foregroundColor(.gray)
                    .font(.body)
            }
            .padding(.top, 100)
            
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.medium)
                
                Text("Profile")
                    .foregroundColor(.gray)
                    .font(.body)
            }
            .padding(.top, 30)
            
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.medium)
                
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.body)
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct TestMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TestMenuView()
    }
}
