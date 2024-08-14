import SwiftUI
var backgroundGradient = LinearGradient(
    colors: [Color.cyan,Color.white,Color.cyan],
    startPoint: .top, endPoint: .bottom)


struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{ backgroundGradient
                .ignoresSafeArea()
                
                VStack {
                    HStack{
                        Image("biblehub-transformed")
                            .resizable()
                            .frame(width: 350, height: 100)
                    }
                    Spacer()
                    VStack{
                        Spacer()
                        NavigationLink(destination: Autores(testamento: vm.velhoTestamento())){
                            Text("Velho testamento")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.blue)
                                .cornerRadius(10)
                        }
                        Spacer()
                        NavigationLink(destination: Autores(testamento: vm.novoTestamento())){
                            Text("Novo testamento")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.blue)
                                .cornerRadius(10)

                     }
                        Spacer()
                        NavigationLink(destination: Mensagem_do_dia()){
                            Text("Mensagem do dia")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.blue)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                }
                .padding()
            }.onAppear(){
                vm.fetchBiblia()
            }
        }
    }
}

#Preview {
    ContentView()
}
