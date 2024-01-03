//
//  MovieService.swift
//  MVVM-MovieProject
//
//  Created by Yasin Kabak on 30.12.2023.
//

import Foundation

//networkle iletisim halinde olacak
class MovieService {
    func downloadMovies(completion: @escaping ([MovieResult]?) -> Void) {
        guard let url = URL(string: APIURLs.movies(page: 1)) else { return }
        let headers = APIHeaders.headers()
        
        NetworkManager.shared.download(url: url, headers: headers) { result in
            switch result {
            case .success(let data):
                completion(self.handleWithData(data: data))
            case .failure(let error):
                self.handleWithErrors(error)
                completion(nil)
            }
        }
    }
    
    private func handleWithErrors(_ error: Error) {
        print(error.localizedDescription)
    }
    
    private func handleWithData(data: Data) -> [MovieResult]? {
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.results
        } catch {
            print(error)
            return nil
        }
    }
}
