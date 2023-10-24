//
//  DataUser.swift
//  LoginViewCode-Curso
//
//  Created by Bruno Abreu on 24/10/23.
//

import UIKit

struct DataUser: Codable {
    var name: String
    var nameImage: String
    
    public func mockData() -> [DataUser] {
        return [
        DataUser(name: "Bruno", nameImage: "teste"),
        DataUser(name: "Kelty", nameImage: "teste"),
        ]
    }
}
