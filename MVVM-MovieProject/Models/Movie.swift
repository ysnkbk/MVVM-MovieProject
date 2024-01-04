

import Foundation

import Foundation

struct Movie: Decodable {
    let results: [MovieResult]?
}

struct MovieResult: Decodable {
    let id: Int?
    let posterPath: String?
    let overview, releaseDate, title: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case overview, title
        case releaseDate = "release_date"
    }
    var _posterPath : String {
        posterPath ?? ""
    }
    var _id: Int {
        id ?? Int.min
    }
    var _title: String {
        title ?? "N/A"
    }
    var _overview: String {
        overview ?? "N/A"
    }
    var _releaseDate: String {
        releaseDate ?? "N/A"
    }
    
}
