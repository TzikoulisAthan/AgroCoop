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
        static let votingTableViewCellIdentifier = "votingTableViewCellIdentifier"
    }
    
    struct ButtonLabels {
        static let priceButtonLabel = "Daily Prices"
        static let contactButtonLabel = "Contact"
        static let newsButtonLabel = "News"
        static let entopioButtonLabel = "E-Ntopio"
        static let membersAnnouncementsButtonLabel = "Latest Announcements"
        static let pricingPolicyButtonLabel = "Articles of Incorporation"
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
    
    struct StaticTexts {
        static let articlesOfIncorporation = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\n 1. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\n 2. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n 3. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\n 4. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n 5. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\n 6. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    }
}
