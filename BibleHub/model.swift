import Foundation

struct IBL : Decodable{
    let _id: String?
    let versiculo: String?
    let localizacao : String?
    let _rev : String?
}

struct biblia : Decodable, Hashable{
    let abbrev: abbrever
    let author: String?
    let chapters: Int?
    let group: String?
    let name: String?
    var testament: String?
}

struct abbrever : Codable, Hashable {
    let pt : String?
    let en : String?
}


struct chapter : Decodable, Hashable{
    var book : Book
    var verses : [verse]
}

struct verse : Decodable, Hashable{
    var number : Int
    var text : String
   // var msg : String
}

struct Book : Decodable, Hashable{
    var abbrev : abbrever
    var name : String
    var author : String
}

