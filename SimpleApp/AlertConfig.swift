//
//  AlertConfig.swift
//  SimpleApp
//
//  Created by Nicolò Curioni on 18/05/22.
//

import Foundation

public struct AlertConfig {
    public var title: String
    public var placeholder: String = ""
    public var add: String = "Add"
    public var cancel: String = "Cancel"
    public var action: (String?) -> ()
}
