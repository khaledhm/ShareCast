//
//  Episodes.swift
//  Podcast
//
//  Created by MacBook on 09/11/2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import FeedKit
class EpisodesController: UITableViewController {
    let cellId = "cellId"
    var episodes = [Episode]()
    var podcast: Podcast? {
        didSet{
            navigationItem.title = podcast?.trackName
            fetchEpisode()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    //MARK:- Episode
    fileprivate func fetchEpisode(){
        print("____________________________________")
        guard let feedUrl =  podcast?.feedUrl else {return}
        print("Looking for episode from feed: ", feedUrl )
        
        guard let url = URL(string: feedUrl) else {return}
        let parser = FeedParser(URL: url)
        
        
        parser.parseAsync(result: { (result) in
            print("Parsing Done:", result.isSuccess)
            switch result {
                
            case let .rss(feed):
                
                let imageUrl = feed.iTunes?.iTunesImage?.attributes?.href
                var episodes = [Episode]()
                feed.items?.forEach({ (feedItem) in
                    var episode = Episode(feedItem: feedItem)
                    
                    if episode.imageUrl == "" {
                        episode.imageUrl = imageUrl
                        
                        
                    }
                    episodes.append(episode)
                    
                })
                self.episodes = episodes
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                }
                break
                
            case let .failure(error):
                print("Feed Parse Error: ", error)
                break
            default:
                print("Found Feed...")
                break
            }
        })
        
    }
    //MARK:- UITableView
    //MARK: Setup work
    fileprivate func setupTableView() {
        tableView.tableFooterView = UIView() // removes table lines
        let nib = UINib(nibName: "EpisodeCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EpisodeCell
        let episode = episodes[indexPath.row]
        cell.episode = episode
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }
    
    
    
    
    
    
    
}
