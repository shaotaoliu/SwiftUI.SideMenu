import SwiftUI

class ViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    @Published var settings = Settings()
    
    static let `default` = ViewModel()
    let profile = Employee(name: "Jack", phone: "210-232-4499", email: "jack@employee.com")
    
    private init() {
        employees.append(Employee(name: "Jason", phone: "910-290-8733", email: "jason@employee.com"))
        employees.append(Employee(name: "Smith", phone: "822-902-8656", email: "smith@employee.com"))
        employees.append(Employee(name: "Kevin", phone: "626-900-6655", email: "kevin@employee.com"))
        employees.append(Employee(name: "Lucas", phone: "714-201-2389", email: "lucas@employee.com"))
        employees.append(Employee(name: "Chris", phone: "650-889-1100", email: "chris@employee.com"))
    }
}

struct Employee {
    let id = UUID()
    var name = ""
    var phone = ""
    var email = ""
}

struct Settings {
    var menuForegroundColor = Color.gray
    var menuBackgoundColor = Color(red: 32/255, green: 32/255, blue: 32/255)
    var activeMenuForegroundColor = Color.blue
    var activeMenuBackgoundColor = Color.gray
}
