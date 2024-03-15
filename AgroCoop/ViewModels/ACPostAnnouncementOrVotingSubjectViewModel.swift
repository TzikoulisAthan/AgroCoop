//
//  ACPostAnnouncementOrVotingSubjectViewModel.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 29/1/24.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

/// Protocol communication with ACPostAnnouncementOrVotingSubjectViewController
protocol ACPostAnnouncementOrVotingSubjectViewModelDelegate {
    func dismissViewController()
}


class ACPostAnnouncementOrVotingSubjectViewModel: NSObject, ACPostAnnouncementOrVotingSubjectViewDelegate {
  
    
    //MARK: - Variable declaration
    private var postAnnouncementView = ACPostAnnouncementOrVotingSubjectViewControllerView()

    var delegate: ACPostAnnouncementOrVotingSubjectViewModelDelegate?
    
    private let db = Firestore.firestore()
    
    /// Counter to keep track of track of the voting Subjects
    /// It will be used as parameter for the name of each document in the firestore database
    private var votingSubjectID: Int = 0
    
    /// Function that saves to Firebase according to the users choice "Announcement", "Voting Subject"
    /// of the segmentedControl view
    /// - Parameters:
    ///   - selectedSegmentIndex: index of the segmentedControl view
    ///   - body: text to be saved as an announcement or as a voting subject
    func didSelectSegment(selectedSegmentIndex: Int, body: String) {
        let currentDate = Date().timeIntervalSince1970
        
        /// When segmentedControlIndex equals 0, a data object is created according to the ACAnnouncementModel
        /// and is stored to the Announcements collection in Firestore db.
        if selectedSegmentIndex == 0 {
            
            let data = ACAnnouncementModel(announcementDate: currentDate, announcementBody: body)

            do {
                try db.collection(Constants.FstoreDB.announcementsCollection)
                    .addDocument(data: [Constants.FstoreDB.announcementBody:data.announcementBody,
                                  Constants.FstoreDB.announcementDate:data.announcementDate])
                delegate?.dismissViewController()
            } catch {
                print("Error saving data")
            }
            
        } 
        
        /// When segmentedControlIndex equals 1, a data object is created according to the ACVotingSubjectModel
        /// and is stored to the VotingSubject collection in Firestore db.
        else if selectedSegmentIndex == 1 {
            let data =  ACVotingSubjectModel(votingSubjectDate: currentDate,
                                             votingSubjectBody: body, votesPro: 0, votesCon: 0)
            do {
                
                try db.collection(Constants.FstoreDB.votingSubjectCollection)
                    .document().setData([Constants.FstoreDB.votingSubjectBody:data.votingSubjectBody,
                                         Constants.FstoreDB.votingSubjectDate:data.votingSubjectDate,
                                         Constants.FstoreDB.votesPro:data.votesPro,
                                         Constants.FstoreDB.votesCon:data.votesCon])
                
                delegate?.dismissViewController()
            } catch {
                print("Error saving data")
            }
        }
    }
    
    //TODO: Create a push notification every time there is a new announcement/voting subject
    
}
