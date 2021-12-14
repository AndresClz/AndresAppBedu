//
//  PlayListDetailView.swift
//  AndresAppNoStoryBoard
//
//  Created by Andres Calizaya on 13/12/2021.
//

import UIKit

class PlayListDetailView: UIViewController {
    let mainStack = UIStackView()
        let topStackView = UIView()
            let topStack = UIStackView()
        let tableView = UIView()
            let playListTableView = UITableView()
        let fooView = UIView()
        let fooView2 = UIView()
    
    let playListName = Init(value: UITextField()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Playlist name..."
        $0.textColor = .gray
        $0.textAlignment = .left
        $0.backgroundColor = UIColor(named : "BackgroundColor")
        //$0.layoutMargins = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        $0.layer.cornerRadius = 5
        $0.borderStyle = .roundedRect
        //$0.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    let addSongsButton = Init(value: UIButton()){
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        $0.setImage(UIImage(systemName: "plus.app", withConfiguration: config), for: .normal)
//        $0.setImage(UIImage(systemName: "plus.app"), for: .normal)
        
        $0.tintColor = UIColor(named: "TextColor")
     
        //$0.addTarget(self, action: #selector(playPause(_:)), for: .touchUpInside)

    }
    
    var tracks = Set<Track>()
    var tracksArray = [Track]()
    
    func addTrack(addedTrack: Track) {
        tracks.insert(addedTrack)
        tracksArray = Array(tracks)
        playListTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.addSubview(mainStack)

        view.backgroundColor = UIColor(named: "BackgroundColor")
        mainStack.fitInSuperviewSafeArea()
        mainStack.axis          = .vertical
        mainStack.alignment     = .fill
        mainStack.distribution  = .fillProportionally
        mainStack.spacing       = 10
        mainStack.layoutMargins = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
        mainStack.isLayoutMarginsRelativeArrangement = true
        
        topStack.axis          = .horizontal
        topStack.alignment     = .fill
        topStack.distribution  = .fillProportionally
        topStack.spacing       = 1
        
        mainStack.addArrangedSubview(topStackView)
        topStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
            //topStackView.backgroundColor = .red
                topStackView.addSubview(topStack)
                    topStack.fitInSuperview()
                    topStack.addArrangedSubview(playListName)
                    topStack.addArrangedSubview(addSongsButton)
                        fooView.backgroundColor = .green
                        fooView2.backgroundColor = .gray
        mainStack.addArrangedSubview(tableView)
            tableView.addSubview(playListTableView)
//        playListTable.translatesAutoresizingMaskIntoConstraints = false
        playListTableView.fitInSuperview()
        playListTableView.backgroundColor = UIColor(named: "BackgroundColor")?.withAlphaComponent(1.5)
        playListTableView.separatorColor = UIColor.systemBlue.withAlphaComponent(0.5)
        playListTableView.separatorStyle = .singleLine
        playListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "track")
        playListTableView.dataSource = self
        playListTableView.delegate = self
        playListTableView.layer.cornerRadius = 10
        tableView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        //tableView.backgroundColor = .blue
              
        
//        addSongsButton.heightAnchor.constraint(lessThanOrEqualToConstant: 45).isActive = true
//        addSongsButton.widthAnchor.constraint(lessThanOrEqualTo: addSongsButton.heightAnchor, multiplier: 1/1).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension PlayListDetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tracksArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "track", for: indexPath)
        let track = tracksArray[indexPath.row]
        cell.backgroundColor = UIColor(named: "AccentColor")?.withAlphaComponent(1.5)
        cell.textLabel?.text = track.title
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets(top: 2.0, left: 5.0, bottom: 2.0, right: 5.0)
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    
}
