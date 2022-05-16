//
//  ContentView.swift
//  SimpleApp
//
//  Created by Nicolò Curioni on 15/05/22.
//

import SwiftUI

struct ContentView: View {
    
    var users: [User] = [
        User(name: "Mario"),
        User(name: "John"),
        User(name: "Tim"),
        User(name: "Steve"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink {
                        DetailView(user: user)
                    } label: {
                        Text(user.name)
                    }
                }
            }.navigationTitle(Text("Simple App"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
