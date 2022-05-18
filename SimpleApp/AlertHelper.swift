//
//  AlertHelper.swift
//  SimpleApp
//
//  Created by Nicolò Curioni on 18/05/22.
//

import SwiftUI

struct AlertHelper<Content: View>: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let alert: AlertConfig
    let content: Content
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AlertHelper>) -> UIHostingController<Content> {
        UIHostingController(rootView: content)
    }
    
    final class Coordinator {
        var alertController: UIAlertController?
        
        init(_ controller: UIAlertController? = nil) {
            self.alertController = controller
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func updateUIViewController(_ uiViewController: UIHostingController<Content>, context: UIViewControllerRepresentableContext<AlertHelper>) {
        uiViewController.rootView = content
        
        if isPresented && uiViewController.presentedViewController == nil {
            var alert = self.alert
            
            alert.action = {
                self.isPresented = false
                self.alert.action($0)
            }
            
            context.coordinator.alertController = UIAlertController(alert: alert)
            
            guard let alertControllerOK = context.coordinator.alertController else { return }
            uiViewController.present(alertControllerOK, animated: true)
        }
        
        if !isPresented && uiViewController.presentedViewController == context.coordinator.alertController {
            uiViewController.dismiss(animated: true)
        }
    }
}
