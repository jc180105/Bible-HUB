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
