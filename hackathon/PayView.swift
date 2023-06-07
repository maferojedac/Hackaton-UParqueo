//
//  PayView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI

struct PayView: View {
    @State var saldo: Int // Money displayed
    @State var paypop: Bool = false // Modal pop up bool
    @State var addpop: Bool = false // Modal pop up bool
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Text("Saldo:")
                    .font(.system(size:25))
                    .frame(alignment: .leading)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            Text("$" + String(saldo))
                .font(.system(size:100))
            Spacer()
            Button(action:{
                addpop.toggle() // activa la ventana modal de agregar fondos
            }){
                ZStack{
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(.green)
                        .frame(width: 300, height:50)
                    HStack{
                        Image(systemName: "creditcard.fill")
                            .foregroundColor(.white)
                        Text("Añadir fondos")
                            .bold()
                            .foregroundColor(.white)

                    }
                    
                }
            }
            Button(action:{
                paypop.toggle() // activa la ventana modal de pagar estacionamiento
            }){
                ZStack{
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(.blue)
                        .frame(width: 300, height:50)
                    HStack{
                        Image(systemName: "ticket.fill")
                            .foregroundColor(.white)
                        Text("Pagar estacionamiento")
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                }
            }
            Spacer()

        }
        .sheet(isPresented: $paypop){
            PayPopUp()
        }
        .sheet(isPresented: $addpop){
            AddPopUP()
        }
    }
}

struct PayView_Previews: PreviewProvider {
    static var previews: some View {
        PayView(saldo : 0)
    }
}
