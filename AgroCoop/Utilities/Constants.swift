//
//  Constants.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 15/1/24.
//

import UIKit

struct Constants {
    
    struct Colors {
        static let buttonTitleColor = UIColor(red: 0, green: 0.7294, blue: 0.1333, alpha: 1.0)
        static let buttonFrameColor = CGColor(red: 0, green: 0.7294, blue: 0.1333, alpha: 1.0)
    }
    
    struct urls {
        static let entopioURL = "https://garlicplatikabu.gr"
        static let newsApiBaseURL = "https://newsapi.org/v2/everything?apiKey=c19faeaeffd24daf890a917921cd6d4e&q=agriculture"
        static let newsApiKey = "c19faeaeffd24daf890a917921cd6d4e"
    }
    
    struct TableViews {
        static let pricesTabelViewCellIdentifier = "pricesTableViewCellIdentifier"
        static let membersAnnouncementsTableViewCellIdentifier = "membersAnnouncementsTableViewCellIdentifier"
        static let newsTableViewCellIdentifier = "newsTableViewCellIdentifier"
    }
    
    struct ButtonLabels {
        static let priceButtonLabel = "Daily Prices"
        static let contactButtonLabel = "Contact"
        static let newsButtonLabel = "News"
        static let entopioButtonLabel = "E-Ntopio"
        static let membersAnnouncementsButtonLabel = "Latest Announcements"
        static let pricingPolicyButtonLabel = "Pricing Policy"
        static let membersListButtonLabel = "Member List"
        static let editPricesButtonLabel = "Edit Prices"
        static let postAnnouncementButtonLabel = "New Announcement"
    }
    
    struct ImageStrings {
        static let logoImageString = "logo"
    }
    
    struct FstoreDB {
        static let productPricesCollection = "ProductPricesCollection"
        
        static let announcementsCollection = "Announcements"
        static let announcementBody = "announcementBody"
        static let announcementDate = "announcementDate"
        static let votingSubjectCollection = "VotingSubject"
        static let votingSubjectBody = "votingSubjectBody"
        static let votingSubjectDate = "votingSubjectDate"
        static let votesPro = "votesPro"
        static let votesCon = "votesCon"
    }
    
}
