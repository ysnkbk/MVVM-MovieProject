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
            "Authorization": "API KEY."
        ]
    }
}
