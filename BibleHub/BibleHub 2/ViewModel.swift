
import Foundation

class ViewModel: ObservableObject{
    @Published var mensagemDia : [IBL] = []
    @Published var Random : IBL?
    @Published var bibliaa : [biblia] = []
    @Published var testamento : biblia?
    
    
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/leitura" )
        else{
            return
        }
        
        
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let parsed = try JSONDecoder().decode([IBL].self, from: data)
                
                DispatchQueue.main.async {
                    self?.mensagemDia = parsed
                    self?.random()
                }
            }catch{
                print(error)
                
            }
        }
        task.resume()
    }
    
    func random(){
        Random = mensagemDia.shuffled().first
    }
    
    func velhoTestamento() -> [biblia] {
        return bibliaa.filter{ $0.testament == "VT" }
    }
    
    func novoTestamento() -> [biblia] {
        return bibliaa.filter{ $0.testament == "NT" }
    }
    
    
    
    func fetchBiblia(){
        guard let url = URL(string: "https://www.abibliadigital.com.br/api/books" )
        else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let parsed = try JSONDecoder().decode([biblia].self, from: data)
                
                DispatchQueue.main.async {
                    self?.bibliaa = parsed
                }
            }catch{
                print(error)
                
            }
        }
        task.resume()
    }
    func fetchChapter(){
        guard let url = URL(string: "https://www.abibliadigital.com.br/api/verses/acf/\(livro)/\(capitulo)" )
        else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let parsed = try JSONDecoder().decode([biblia].self, from: data)
                
                DispatchQueue.main.async {
                    self?.bibliaa = parsed
                }
            }catch{
                print(error)
                
            }
        }
        task.resume()
    }
}


