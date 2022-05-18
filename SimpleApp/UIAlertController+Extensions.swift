//
//  UIAlertController+Extensions.swift
//  SimpleApp
//
//  Created by Nicolò Curioni on 18/05/22.
//

import SwiftUI

extension UIAlertController {
    convenience init(alert: AlertConfig) {
        self.init(title: alert.title, message: nil, preferredStyle: .alert)
        addTextField { $0.placeholder = alert.placeholder }
        addAction(UIAlertAction(title: alert.cancel, style: .cancel) { _ in
            alert.action(nil)
        })
        let textField = self.textFields?.first
        addAction(UIAlertAction(title: alert.add, style: .default) { _ in
            alert.action(textField?.text)
        })
    }
}

extension View {
    public func alert(isPresented: Binding<Bool>, _ alert: AlertConfig) -> some View {
        AlertHelper(isPresented: isPresented, alert: alert, content: self)
    }
}
