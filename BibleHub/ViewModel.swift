
import Foundation

class ViewModel: ObservableObject{
    
    var theToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdHIiOiJUdWUgQXByIDIzIDIwMjQgMTI6MjI6MDAgR01UKzAwMDAucGVkcm9oamMxODBAZ21haWwuY29tIiwiaWF0IjoxNzEzODc0OTIwfQ.BxaVc5mlMOx00NvODzCO6-BPGaqhSbzsZxbPq91ulSc"
    @Published var mensagemDia : [IBL] = []
    @Published var Random : IBL?
    @Published var bibliaa : [biblia] = []
    @Published var testamento : biblia?
    @Published var verses : [verse] = []
   
    
    
    func fetch(){
        guard let url = URL(string: "http://192.168.128.30:1880/leitura" )
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
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
          "Content-Type": "application/json",
          "Authorization":"Bearer \(theToken)"
        ]

        
        let task = URLSession.shared.dataTask(with: request){ [weak self] data, _, error in
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
    
    
    func fetchChapter(_ livro : String, _ capitulo : Int){
        guard let url = URL(string: "https://www.abibliadigital.com.br/api/verses/acf/\(livro)/\(capitulo)" )
               
        else{
            return
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
          "Content-Type": "application/json",
          "Authorization":"Bearer \(theToken)"
        ]
        
        let task = URLSession.shared.dataTask(with: request){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let parsed = try JSONDecoder().decode(chapter.self, from: data)
                
                DispatchQueue.main.async {
                    self?.verses = parsed.verses
                    print(url)
                    print(parsed)
                }
            }catch{
                print(error)
                
            }
        }
        task.resume()
    }

}


