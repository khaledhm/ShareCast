//
//  Episode.swift
//  Podcast
//
//  Created by MacBook on 09/11/2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import FeedKit
struct Episode {
    var title : String
    var pubDate : Date
    var description : String
    var imageUrl : String?
    
    init(feedItem : RSSFeedItem) {
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.description = feedItem.description ?? ""
        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href ?? ""
        
        
    }
}
