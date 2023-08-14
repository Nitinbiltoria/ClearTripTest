//
//  MusicListTableViewCell.swift
//  MusicPlayer
//
//  Created by Nitin on 14/08/23.
//

import Foundation
import UIKit

class MusicListTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!

    var musicData: MusicList? {
        didSet {
            titleLabel.text = "\(musicData?.title ?? "Not found")"
        }
    }
}
