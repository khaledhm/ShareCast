//
//  EpisodeCell.swift
//  Podcast
//
//  Created by MacBook on 14/11/2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {
    
    var episode : Episode! {
        didSet{
            //Adding the stuff in the stuff
            //Some description are html encoded, so we have to convert them to pure String
            self.descriptionLabel.text = episode?.description.html2String
            self.titleLabel.text = episode.title
            //formating the date for the cell
            let dateFormattor = DateFormatter()
            dateFormattor.dateFormat = "MMM dd, yyyy"
            self.pubDateLabel.text = dateFormattor.string(from: episode.pubDate)
            
            let imageUrl = episode.imageUrl ?? ""
            let url = URL(string: imageUrl)
            episodeImageView.sd_setImage(with: url)
            
            
        }
    }
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
}
