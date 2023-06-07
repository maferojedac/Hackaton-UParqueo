//
//  UserModel.swift
//  hackathon
//
//  Created by iOS Lab on 06/06/23.
//

import Foundation
import SwiftUI

func main() {
    // Creating random users
    let user1 = Users(name: "John Doe", email: "john@example.com", password: "password1", money: 1000, creditCardNumber: "1234567890123456", creditCardCVV: "123", creditCardExpirationDate: "12/23")
    let user2 = Users(name: "Jane Smith", email: "jane@example.com", password: "password2", money: 2000, creditCardNumber: "9876543210987654", creditCardCVV: "456", creditCardExpirationDate: "06/25")
    let user3 = Users(name: "Bob Johnson", email: "bob@example.com", password: "password3", money: 500, creditCardNumber: "5555444433332222", creditCardCVV: "789", creditCardExpirationDate: "09/24")
    
    // Encoding users as JSON
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    do {
        let user1Data = try encoder.encode(user1)
        let user2Data = try encoder.encode(user2)
        let user3Data = try encoder.encode(user3)
        
        if let user1JSONString = String(data: user1Data, encoding: .utf8),
           let user2JSONString = String(data: user2Data, encoding: .utf8),
           let user3JSONString = String(data: user3Data, encoding: .utf8) {
            // Printing the JSON strings
            print("User 1 JSON:\n\(user1JSONString)\n")
            print("User 2 JSON:\n\(user2JSONString)\n")
            print("User 3 JSON:\n\(user3JSONString)\n")
            
            
        }
    } catch {
        print("Error encoding users: \(error)")
    }
    
}

struct Users: Codable {
    var name: String
    var email: String
    var password: String
    var money: Int
    var creditCardNumber: String
    var creditCardCVV: String
    var creditCardExpirationDate: String
}


