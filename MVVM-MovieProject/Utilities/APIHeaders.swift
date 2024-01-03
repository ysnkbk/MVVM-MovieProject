//
//  APIHeaders.swift
//  MVVM-MovieProject
//
//  Created by Yasin Kabak on 2.01.2024.
//

import Foundation

enum APIHeaders {
    static func headers() -> [String: String] {
        return [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMGMyZGE0NzNmNmFiMGE1MTVmMWVjYjY4ZmNkMWJkMCIsInN1YiI6IjY1OGViNjIyY2EwZTE3NjA3YmJhNzJiYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0vWjxzsMI4cyUxmkIcw8mECrfOqbk1tBiTvGAD30M7U"
        ]
    }
}
