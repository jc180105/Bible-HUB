//
//  Autores.swift
//  BibleHub
//
//  Created by Turma01-8 on 18/04/24.
//

import SwiftUI

var backgroundGradient2 = LinearGradient(
    colors: [Color.cyan,Color.white,Color.cyan],
    startPoint: .top, endPoint: .bottom)

class Pesquisar: ObservableObject{
    @Published var livro = String()
    @Published var capitulo = String()
}


struct Autores: View {
    var testamento: [biblia]
    @StateObject var viewmodel = ViewModel()
    @State private var boleana = false
    
    var body: some View {
        NavigationStack{
            ZStack{backgroundGradient2
                .ignoresSafeArea()
                VStack {
                    HStack{
                        Image("biblehub-transformed")
                            .resizable()
                            .frame(width: 350, height: 100)
                    }
                    Spacer()
                    ScrollView{
                        VStack{
                            ForEach(testamento, id: \.self){ index in
                                
                                
                                    VStack{
                                        Text(index.name!)
                                            .font(.title)
                                            .bold()
                                        Spacer()
                                        
                                    }.onTapGesture {
                                        Pesquisar().livro = index.abbrev.pt!
                                        boleana.toggle()
                                    }.sheet(isPresented: $boleana) {
                                        
                                    }
                                
                            }
                        }
                    }
                }
                .onAppear(){
                viewmodel.fetchBiblia()
                }
            }
        }
    }
}

//#Preview {
//    Autores()
//}
