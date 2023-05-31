//
//  ContentView.swift
//  userapp
//
//  Created by Matias Yliluoma on 30.5.2023.
//
import SwiftUI

/// This is the only view this application shows.
/// It contains 2 text fields for generating name and 2 buttons
/// for fetching all the users and adding one user
 
 
struct ContentView: View {
    @State private var users: [UserArray] = [] // Add a state variable to store the users
    @State var addFirst : String = "" // State variable for adding first name
    @State var addLast : String = "" // State variable for adding last name
   // @State var byFirst : String = "" // This feature left out undone
    var body: some View {
        ScrollView {
            VStack {
             /*   TextField("Search user", text: $byFirst)
                
                Button("Start searching") {
                    SearchUser.search(byFirst : byFirst)
                }*/
                TextField("Add firstname", text: $addFirst)
                    .padding()
                TextField("Add lastname", text: $addLast)
                    .padding()
                Button("Add user") {
                    AddUser.adding(addFirst : addFirst, addLast : addLast, to : users) { newUser in
                        
                        /// updates the state variable users so new user gets printed
                         
                        
                        users = newUser
                        addFirst = ""
                        addLast = ""
                    }
                }
                Button("Get users") {
                    getUsers()
                }
                .padding()
                
                 
                /// Loop over the users and display them
                /// id was parsed so we can do displaying users like this
                 
                
                ForEach(users, id: \.id) { user in
                    Text(user.firstName + " " + user.lastName)
                }
            }
        }
        .padding()
    }
    
    /// Function getUsers: Calls makeRequest function from HttpResponse struct
    /// and it fetches all the users
     
     
    
    func getUsers() {
            HttpResponse.makeRequest { result in
                switch result {
                case .success(let userModel):
                    users = userModel.users // Update the state variable with the users
                case .failure(let error):
                    // Handle error
                    print("Request failed: \(error)")
                }
            }
        }
}

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
