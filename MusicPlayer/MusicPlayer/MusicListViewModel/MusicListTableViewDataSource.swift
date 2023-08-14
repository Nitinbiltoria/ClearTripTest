//
//  MusicListTableViewDataSource.swift
//  MusicPlayer
//
//  Created by Nitin on 14/08/23.
//

import Foundation
import UIKit

class MusicListTableViewDataSource<Cell: UITableViewCell, T>: NSObject, UITableViewDataSource {
    private var cellIdentifier: String
    private var items: [T]?
    var configCell: ((Cell, T) -> Void)?

    init(cellIdentifier: String, items: [T], configCell: ((Cell, T) -> Void)? = nil) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configCell = configCell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? Cell {
            if let item = items?[indexPath.row] {
                configCell?(cell, item)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
}
