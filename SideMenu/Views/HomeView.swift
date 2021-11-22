import SwiftUI

struct HomeView: View {
    @State var showNewSheet = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Employees")
                .font(.title)
                .bold()
                .padding()
            
            List {
                ForEach(ViewModel.default.employees, id: \.id) { e in
                    Text(e.name)
                }
            }
            .listStyle(.plain)
        }
        .navigationBarItems(
            trailing:
                Button("New") {
                    showNewSheet = true
                }
                .sheet(isPresented: $showNewSheet) {
                    Text("Adding a new employee ...")
                }
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
