//
//  LoginView.swift
//  hackathon
//
//  Created by iOS Lab on 30/04/23.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var email: String = ""
    @State var psswrd: String = ""
    @State var storedJSON: String = ""

    
    var body: some View {
        
        VStack {
            Image("logo4")
                .resizable()
                .frame(width:300, height:300)
            
            Group {
                TextField("Correo", text: $email)
                    .frame(width: 350, height: 30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(10)
                    .textContentType(.emailAddress)
                SecureField("Contraseña", text: $psswrd)
                    .frame(width: 350, height: 30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    //codigo de inciiar sesion normal
                    SaveUserDataToJson()
                    dismiss()
                    
                }, label: {
                    Text("Iniciar sesión".uppercased())
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }).padding(30)
                
                Button(action: {
                    // printing my stored data
                    PrintStoredUserData()
//                    dismiss()
                    
                }, label: {
                    Text("Iniciar sesión con Google".uppercased())
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }).padding(30)
                
            }
        }
        
        
    }
    
    func SaveUserDataToJson() {
        let userData = Users(name: "", email: email, password: psswrd, money: 0, creditCardNumber: "", creditCardCVV: "", creditCardExpirationDate: "")
            
            do {
                let encoder = JSONEncoder()
                let jsonData = try encoder.encode(userData)
                
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    SaveJSONDataLocally(jsonData: jsonData)
                    storedJSON = jsonString
                    // Store the JSON string wherever you need it
                    print(storedJSON)
                }
            } catch {
                print("Error encoding user data: \(error)")
            }
        }
    
    func PrintStoredUserData() {
            guard let jsonData = LoadJSONDataLocally() else {
                print("Error converting JSON string to data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(Users.self, from: jsonData)
                
                // Print the stored user data
                print("Name: \(user.name)")
                print("Email: \(user.email)")
                print("Password: \(user.password)")
                print("Money: \(user.money)")
                print("Credit Card Number: \(user.creditCardNumber)")
                print("Credit Card CVV: \(user.creditCardCVV)")
                print("Credit Card Expiration Date: \(user.creditCardExpirationDate)")
            } catch {
                print("Error decoding user data: \(error)")
            }
    }
    
    func SaveJSONDataLocally(jsonData: Data) {
            guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                print("Error accessing documents directory")
                return
            }
            
            let fileURL = documentsDirectory.appendingPathComponent("userData.json")
            
            do {
                try jsonData.write(to: fileURL)
                print("JSON data saved locally.")
            } catch {
                print("Error saving JSON data: \(error)")
            }
        }
        
        func LoadJSONDataLocally() -> Data? {
            guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                print("Error accessing documents directory")
                return nil
            }
            
            let fileURL = documentsDirectory.appendingPathComponent("userData.json")
            
            do {
                let jsonData = try Data(contentsOf: fileURL)
                return jsonData
            } catch {
                print("Error loading JSON data: \(error)")
                return nil
            }
        }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        
    }
}
