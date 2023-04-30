//
//  PayPopUp.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI
import Combine

struct PayPopUp: View {
    @Environment(\.dismiss) var dismiss
    
    @State var idbol : String = ""  // String del ID del ticket
    
    var body: some View {
        let ticket = RetrieveTicket(idbol) // Info del ticket ingresado
        VStack{
            Spacer()
            ZStack{
                Circle()
                    .foregroundColor(.blue)
                    .frame(width:200)
                Image(systemName: "ticket")
                    .resizable()
                    .frame(width:120, height:100)
                    .foregroundColor(.white)
                    
            }
            VStack(alignment: .leading){
                Text("ID de tu boleto:")
                TextField("ID", text: $idbol)
                    .frame(width:300)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(5)
                    .keyboardType(.decimalPad)
                    .onReceive(Just(idbol)) { value in
                                let filtered = "\(value)".filter { "0123456789".contains($0) }
                                if filtered != value {
                                    self.idbol = "\(filtered)"
                                }
                            }

                Spacer()
                    .frame(height:10)
                
                
                if ticket.name != "" {
                    VStack (alignment: .leading){
                        Divider()
                        Text("Nombre: "+ticket.name)
                        Text("Hora de llegada: "+ticket.arrival)
                        Text("Hora de salida: "+ticket.departure)
                        Text("A pagar: $"+String(ticket.charge))
                        Divider()
                    }
                }
            }.padding(15)
           
            Button(action:{
                if(ticket.name != ""){
                    //codigo donde se le resta al saldo
                    dismiss()
                }
            }) {
                ZStack{
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width:100, height: 30)
                    Text("Pagar")
                        .foregroundColor(.white)
                }
            }.padding(20)
            Spacer()
        }
    }
}

struct TicketData{
    var name : String
    var arrival : String
    var departure : String
    var charge : Int
    var matricula : String
}

func RetrieveTicket(_ ticketID : String)-> TicketData{
    var ticket = TicketData(name: "Pepito", arrival: "10:00", departure: "17:00", charge: 100, matricula: "RSD1324")
    // Acá se construye un ticket de ejemplo nada más, con el propósito de probar la función en el código. Idealmente, esta función se conectaría con la base de datos y obtendría el ticket en base al ID desde ahí, y regresaría el valor del ticket encontrado.
    if ticketID != "123456789"{
        ticket = TicketData(name: "", arrival: "", departure: "", charge: 0, matricula: "")
    }
    return ticket
}


struct PayPopUp_Previews: PreviewProvider {
    static var previews: some View {
        PayPopUp()
    }
}
