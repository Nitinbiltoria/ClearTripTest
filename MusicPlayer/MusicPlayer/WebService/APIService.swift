//
//  APIService.swift
//  MusicPlayer
//
//  Created by Nitin on 14/08/23.
//

import Foundation

class APIService {
    private let sourceURL = URL(string: "https://api.audd.io/")
    private let params: [String: Any] = [
        "url": "https://audd.tech/example.mp3",
        "return": "apple_music,spotify",
        "api_token": "test",
    ]
    
    func makeRequestForMusicList(completion: @escaping (_ data: MusicListModel?, _ error: String?) -> Void) {
        guard let url = sourceURL else {
            print("url is invalid")
            return
        }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: params, options: [])
            var request = URLRequest(url: url)
            request.httpBody = jsonData
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            print(request)
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                if let error = error {
                    completion(nil, error.localizedDescription)
                    return
                }
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let musicData = try? jsonDecoder.decode(MusicListModel.self, from: data)
                        completion(musicData, nil)
                    }
                }
            }
            
            task.resume()
        } catch {
            print(" json serialization failed")
        }
    }
}
