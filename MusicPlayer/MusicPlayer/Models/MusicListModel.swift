//
//  MusicListModel.swift
//  MusicPlayer
//
//  Created by Nitin on 14/08/23.
//

import Foundation

struct MusicListModel: Codable {
    var status: String?
    var result: [MusicList]?
}

struct MusicList: Codable {
    var title: String?
    var link: String?

    enum CodingKeys: String, CodingKey {
        case title
        case link = "song_link"
    }
}
