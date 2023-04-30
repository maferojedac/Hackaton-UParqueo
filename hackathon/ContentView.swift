//
//  ContentView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var piso: Int = 1            // Número del piso
    @State var lista : [Int] = []       // IDs de los estracionamientos libres, los cuales se obtienen de la base de datos, idealmente.
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text("Piso " + String(piso))
                    .font(.system(size:30))
                    .bold()
                Text("Disponibles: "+String(lista.count))
                
            }
            Spacer()
            VStack{
                grid(lista) // Función que genera la cuadrícula de estacionamientos
            }
        }.padding(30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(lista: [1, 2, 6, 7, 8, 12])
    }
}

func grid(_ paq : [Int])-> some View{
    HStack{
        ForEach(1...4, id: \.self){column in
            if(column==3){
                Spacer()
                    .frame(width:40)
            }
            VStack{
                ForEach(1...24, id: \.self){line in
                    let x = 97 - ( line + (column - 1)*24) // Numero de estacionamiento, se puede personalizar dependiendo del número de estacionamientos total
                    ZStack{
                        if paq.contains(x) { // Revisa si el estacionamiento esta libre o no
                            RoundedRectangle(cornerRadius: 100)
                                .foregroundColor(.green)
                                .frame(width: 30)
                        }else
                        {
                            RoundedRectangle(cornerRadius: 100)
                                .foregroundColor(.red)
                                .frame(width: 30)

                        }
                        Text(String(x))
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
        }
    }
}
