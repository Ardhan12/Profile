//
//  ContentView.swift
//  Profile
//
//  Created by Arief Ramadhan on 20/07/22.
//

import SwiftUI

class ProfileViewModel: ObservableObject{
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var age = ""
    @Published var ageIsShowing = false
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    func ageStatement() -> String {
        return ageIsShowing ? "i'm \(age) years" : ""
    }
}

struct ContentView: View {
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    }
                Section {
                    TextField("Age", text: $viewModel.age)
                    Toggle(isOn: $viewModel.ageIsShowing) {
                        Text("Toggle")
                    }
                } footer: {
                    Text("Turn the toggle on to show your ages")
                }
                Section {
                    ResultView(profileViewModel: viewModel)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct ResultView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        Text("My name is \(profileViewModel.fullName). \(profileViewModel.ageStatement())")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ProfileViewModel())
    }
}


