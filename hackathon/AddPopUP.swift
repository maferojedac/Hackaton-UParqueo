//
//  AddPopUP.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI

struct AddPopUP: View {
    @Environment(\.dismiss) var dismiss
    // Variables que se conectarian con la base de datos
    @State var tarjeta : String = "" // c guarda la tarjeta
    @State var cvv : String = ""    // c guarda la contraseña de la tarjeta
    @State var fde : String = ""    // fecha de expiracion
    @State var saldo : String = ""  // saldo a agregar
    
    var body: some View {
        VStack (){
            Spacer()
            ZStack{
                Circle()
                    .foregroundColor(.blue)
                    .frame(width:200)
                Image(systemName: "creditcard")
                    .resizable()
                    .frame(width:120, height:100)
                    .foregroundColor(.white)
            }
            Spacer()
            VStack(alignment: .leading){
                Text("Numero de tarjeta:")
                TextField("Numero de tarjeta", text: $tarjeta)
                    .frame(width:300)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack{
                    Text("CVV:")
                    TextField("CVV", text: $cvv)
                        .frame(width:100)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Fecha de expiración:")
                    TextField("MM/AA", text: $fde)
                        .frame(width:100)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Text("Saldo a agregar:")
                TextField("Saldo a agregar", text: $saldo)
                    .frame(width:300)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Spacer()
            Button(action:{
                //codigo donde se añade el saldo y se hace el cobro
                dismiss()
            }) {
                ZStack{
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width:100, height: 30)
                    Text("Pagar")
                        .foregroundColor(.white)
                }
            }
            Spacer()
            
        }
        
    }
}

struct AddPopUP_Previews: PreviewProvider {
    static var previews: some View {
        AddPopUP()
    }
}
