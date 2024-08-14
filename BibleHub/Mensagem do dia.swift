//
//  Mensagem do dia.swift
//  BibleHub
//
//  Created by Turma01-8 on 18/04/24.
//

import SwiftUI
import AVFoundation


var backgroundGradient1 = LinearGradient(
    colors: [Color.white,Color.cyan],
    startPoint: .top, endPoint: .bottom)




struct Mensagem_do_dia: View {
    @State private var texto : String = ""
    @State private var speechSynthesizer: AVSpeechSynthesizer?
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
                        
                        VStack {
                            Spacer()
                            Button() {
                                
                                let audioSession = AVAudioSession()
                                do {
                                    try audioSession.setCategory(.playback, mode: .default, options: .duckOthers)
                                    try audioSession.setActive(false)
                                } catch let error {
                                    print("❓", error.localizedDescription)
                                }
                                
                                speechSynthesizer = AVSpeechSynthesizer()
                                
                                let speechUtterance = AVSpeechUtterance(string: "\(viewmodel.Random!.versiculo!) \(viewmodel.Random!.localizacao!)")
                                speechUtterance.voice = AVSpeechSynthesisVoice(language: "pt")
                                
                                speechSynthesizer?.speak(speechUtterance)
                            }label: {
                                Image(systemName: "speaker.2.fill")
                                    .resizable(resizingMode: .stretch)
                                    .foregroundColor(Color.black)
                                    .frame(width: 50.0, height: 50.0)
                            }
                            .frame(width: 100.0, height: 100.0)
                            Text("Clique para escutar")
                            Spacer()
                        }
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
    
