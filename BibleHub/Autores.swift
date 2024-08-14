//
//  Autores.swift
//  BibleHub
//
//  Created by Turma01-8 on 18/04/24.
//

import SwiftUI

var backgroundGradient2 = LinearGradient(
    colors: [Color.white,Color.cyan],
    startPoint: .top, endPoint: .bottom)

class Pesquisar: ObservableObject{
    @Published var livro = String()
    @Published var capitulo = String()
}


struct Autores: View {
    @State private var boleana = false
    @StateObject var viewmodel = ViewModel()
    
    @State var testamento: [biblia]
    @State var livro : biblia =  biblia(abbrev: abbrever(pt: nil, en: nil), author: nil, chapters: nil, group: nil, name: nil)
    
    
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
                            
                            Text("LIVROS")
                                .font(.title)
                                .bold()
                            
                            ForEach(testamento, id: \.self){ index in
                                
                                
                                VStack{
                                    HStack{
                                        Text("\(index.name!)" )
                                            .frame(width: 280, height: 30)
                                            .font(.title)
                                            .colorInvert()
                                            .bold()
                                            .background(.blue)
                                            .cornerRadius(5)
                                            
                                         
                                            
                                        
                                    }.padding(2)
                                    
                                    
                                }.onTapGesture {
                                    livro = index
                                    boleana.toggle()
                                    
                                }
                                
                            }
                        }.sheet(isPresented: $boleana) {
                            SheetCapitulos(livro: $livro)
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
