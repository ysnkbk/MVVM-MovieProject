//
//  APIURLs.swift
//  MVVM-MovieProject
//
//  Created by Yasin Kabak on 30.12.2023.
//

import Foundation
//()'li bir yapı oluşmasın diye
enum APIURLs{
    static func movies(page : Int) -> String{
        "https://api.themoviedb.org/3/movie/popular?language=en-US&page=\(page)"
      
    }
    static func imageUrl(posterPath : String) -> String{
        "https://image.tmdb.org/t/p/w500/\(posterPath)"
    }
}
