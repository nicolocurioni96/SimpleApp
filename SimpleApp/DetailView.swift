//
//  DetailView.swift
//  SimpleApp
//
//  Created by Nicolò Curioni on 16/05/22.
//

import SwiftUI

struct DetailView: View {
    
    var user: User
    
    var body: some View {
        VStack {
            Text(user.name)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User(id: UUID(), name: "Mario Test"))
    }
}
