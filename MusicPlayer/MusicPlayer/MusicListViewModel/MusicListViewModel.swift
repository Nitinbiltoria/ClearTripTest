//
//  MusicListViewModel.swift
//  MusicPlayer
//
//  Created by Nitin on 14/08/23.
//

import Foundation

class MusicListViewModel {
    private var apiService: APIService!
    private(set) var musicData: MusicListModel?

    var bindMusicDataToVC: (() -> Void)?

    init() {
        apiService = APIService()
    }

    func getMusicList() {
        apiService.makeRequestForMusicList { [weak self] data, error in
            guard let _ = error else {
                print(error)
                return
            }

            if let data = data { 
                self?.musicData = data
                self?.bindMusicDataToVC?()
            }
        }
    }
}
