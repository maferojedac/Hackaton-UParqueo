//
//  MainView.swift
//  hackathon
//
//  Created by iOS Lab on 30/04/23.
//

import SwiftUI

struct MainView: View {
    
    @State var user = User(name:"Pepito", money: 300)
    @State var data = RetrieveData()
    
    var body: some View {
        NavigationView(){
            VStack{
                HStack{
                    Image("logo3")
                        .resizable()
                        .frame(width:100, height:90)
                    Spacer()
                    VStack{
                        Text(user.name)
                            .bold()
                            .font(.system(size:25))
                    }
                    ZStack{
                        Circle()
                            .foregroundColor(.gray)
                            .frame(height:50)
                            .opacity(0.5)
                        Image(systemName:"person.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width:25, height:25)
                    }
                }
                Text("Tu saldo es:")
                    .bold()
                    .font(.system(size:25))
                Text("$"+String(user.money/100))
                    .font(.system(size:25))
                    .padding(25)
                NavigationLink(destination:PayView(saldo: user.money)){
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width:175, height: 30)
                            .foregroundColor(.red)
                        HStack{
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                            Text("Consultar Saldo")
                                .foregroundColor(.white)
                        }
                    }
                }
                VStack(alignment:.leading){
                    ForEach(data){
                        pisoact in
                        NavigationLink(destination: ContentView(piso: pisoact.Piso, lista: pisoact.Disponibles)){
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .foregroundColor(.cyan)
                                    .frame(width:250, height: 75)
                                VStack(alignment: .leading){
                                    Text("Piso "+String(pisoact.Piso))
                                        .bold()
                                        .font(.system(size:25))
                                    Text("Lugares disponibles: "+String(pisoact.Disponibles.count))
                                }.foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding()
                
            }
            .padding()
        }
    }
}
                    

struct User{
    var name : String
    var money : Int
}

struct Piso : Identifiable{
    var id = UUID()
    var Piso : Int
    var Disponibles : [Int]
}

func RetrieveData()-> [Piso]{
    var data = [Piso]()
        for i in 1...5 {
            var gen = Piso(Piso: i, Disponibles: makeList(.random(in: 1...78)))
            if(i == 1){
                gen.Disponibles.removeAll()

            }
            data.append(gen)

    }
        return data
}

func makeList(_ n: Int) -> [Int] {
    return (0..<n).map { _ in .random(in: 1...96) }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
