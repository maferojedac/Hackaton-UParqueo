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
                    
                    print("navingationStack")
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
                    // codigo de iniciar sesion con google xd
                    dismiss()
                    
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
            let userData = UserData(email: email, password: psswrd)
            
            do {
                let encoder = JSONEncoder()
                let jsonData = try encoder.encode(userData)
                
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    storedJSON = jsonString
                    // Store the JSON string wherever you need it
                    print(jsonString)
                }
            } catch {
                print("Error encoding user data: \(error)")
            }
        }
}

struct UserData: Codable {
    let email: String
    let password: String
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        
    }
}
