//
//  MusicListController.swift
//  MusicPlayer
//
//  Created by Nitin on 14/08/23.
//

import UIKit

class MusicListController: UIViewController {
    @IBOutlet var musicFileListTableview: UITableView!
    private var musicListViewModel: MusicListViewModel?
    private var dataSource: MusicListTableViewDataSource<MusicListTableViewCell, MusicList>?

    override func viewDidLoad() {
        super.viewDidLoad()
        getmusicDataAndUpdateUI()
    }

    func getmusicDataAndUpdateUI() {
        musicListViewModel = MusicListViewModel()
        musicListViewModel?.bindMusicDataToVC = { [weak self] in
            self?.updateDataSource()
        }
        musicListViewModel?.getMusicList()
    }

    func updateDataSource() {
        guard let musicData = musicListViewModel?.musicData?.result else { return }
        dataSource = MusicListTableViewDataSource(cellIdentifier: "MusicListTableViewCell", items: musicData, configCell: { tableviewCell, data in
            tableviewCell.titleLabel?.text = data.title
        })

        DispatchQueue.main.async {
            self.musicFileListTableview.dataSource = self.dataSource
            self.musicFileListTableview.reloadData()
        }
    }
}
