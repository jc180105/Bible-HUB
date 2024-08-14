//
//  SheetCapitulos.swift
//  BibleHub
//
//  Created by Turma01-8 on 23/04/24.
//

import SwiftUI
var backgroundGradient4 = LinearGradient(
    colors: [Color.cyan,Color.cyan],
    startPoint: .top, endPoint: .bottom)

struct SheetCapitulos: View {
    
    
    @Binding var livro: biblia
    
    let colums = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        ZStack{backgroundGradient4
            
            VStack{
                
                
                Text(livro.name!)
                    .font(.title)
                    
                
                NavigationStack{
                    ZStack{
                        backgroundGradient4
                            
                        ScrollView{
                            LazyVGrid(columns: colums){
                                
                                
                                
                                ForEach(1...livro.chapters! , id: \.self ) { index in
                                    
                                    NavigationLink("\(index)", destination: Versiculos(sigla: livro.abbrev.pt!, chapterClicked: index))
                                        .buttonStyle(BlueButton())
                                    
                                    
                                }
                            }
                        }
                    }.ignoresSafeArea()
                }
            }
            
        }
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 30, height: 30)
            .padding()
            .background(Color(red: 1, green: 1, blue: 1))
            .foregroundStyle(.black)
            .clipShape(Rectangle())
           
            
        
        
        
    }
}

