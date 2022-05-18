//
//  ContentView.swift
//  SimpleApp
//
//  Created by Nicolò Curioni on 15/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAddAlertShowed = false
    @State private var newItem = ""
    
    @State private var users: [User] = [
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
                            .font(.footnote)
                            .foregroundColor(.black)
                    }
                }
                .onDelete(perform: delete)
                
            }
            .navigationTitle(Text("Simple App"))
            .navigationBarItems(trailing: Button {
               didShowAlert()
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.black)
            })
        }
        .alert(isPresented: $isAddAlertShowed, AlertConfig(title: "Add New Entry", action: { textFieldName in
            guard let name = textFieldName else { return }
            
            newItem = name
            
            self.addNewItem(newItem)
            
            print("\(name)")
        }))
    }
    
    // MARK: - Actions
    
    private func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
    
    private func didShowAlert() {
        self.isAddAlertShowed = true
    }
    
    private func addNewItem(_ name: String) {
        let user = User(id: UUID(), name: name)
        users.append(user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
