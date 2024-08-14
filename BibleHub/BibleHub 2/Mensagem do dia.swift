//
//  Mensagem do dia.swift
//  BibleHub
//
//  Created by Turma01-8 on 18/04/24.
//

import SwiftUI



var backgroundGradient1 = LinearGradient(
    colors: [Color.cyan,Color.white,Color.cyan],
    startPoint: .top, endPoint: .bottom)




struct Mensagem_do_dia: View {
    
    @StateObject var viewmodel = ViewModel()
    var body: some View {
        NavigationStack{
            ZStack{backgroundGradient1
                .ignoresSafeArea()
                
                
                VStack {
                    HStack{
                        Image("biblehub-transformed")
                            .resizable()
                            .frame(width: 350, height: 100)
                    }
                    
                    VStack{
                        Spacer()
                        if (viewmodel.Random != nil){
                            HStack{
                                Text("Mensagem do dia")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            }
                            HStack{
                                Text(viewmodel.Random!.versiculo!)
                                    .font(.title2)
                            }
                            .padding()
                            HStack{
                                Spacer()
                                Text(viewmodel.Random!.localizacao!)
                            }
                            .padding()
                            
                            
                        }
                       Spacer()
                    
                        
                        
                    }
                    
                }
                
                Spacer()
            }
            
        }
        .onAppear(){
            viewmodel.fetch()
        }
    }
}




#Preview {
    Mensagem_do_dia()
}
