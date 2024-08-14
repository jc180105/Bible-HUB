//
//  Versiculos.swift
//  BibleHub
//
//  Created by Turma01-8 on 22/04/24.
//

import SwiftUI


var backgroundGradient3 = LinearGradient(
    colors: [Color.white,Color.cyan],
    startPoint: .top, endPoint: .bottom)



struct Versiculos: View {
    
    @StateObject var vm = ViewModel()
    
    
    
    
    var sigla : String
    //var chapter : chapter
    var chapterClicked : Int
    
    var body: some View {
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
                    ForEach(vm.verses , id: \.self ) { chap in
                        
                        
                        HStack{
                            
                            
                            Text("\(chap.number)").bold()
                                .frame(alignment: .top)
                            
                            
                            
                            Text("\(chap.text)")
                        }.padding()
                        Spacer()
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                }
            }.onAppear(){
                vm.fetchChapter(sigla, chapterClicked)
            }
        }
    }
}

//#Preview {
//    Versiculos()
//}
