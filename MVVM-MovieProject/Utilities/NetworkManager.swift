import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    @discardableResult
    func download(url: URL, headers: [String: String]?, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
        let dataTask : URLSessionDataTask!
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badURL)))
                return
            }
            
            completion(.success(data))
            print(data)
        }
        dataTask.resume()
        return dataTask
    }
}
