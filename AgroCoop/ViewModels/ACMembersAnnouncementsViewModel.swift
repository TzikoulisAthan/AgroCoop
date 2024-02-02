//
//  ACMembersAnnouncementsViewModel.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 28/1/24.
//

import UIKit
import FirebaseFirestore

protocol ACMembersAnnouncementsViewModelDelegate {
    func didLoadAnnouncement()
}

class ACMembersAnnouncementsViewModel: NSObject {
    
    //MARK: - Variable declaration
    private let db = Firestore.firestore()
    
    private var loadedAnnouncements = [ACAnnouncementModel]()
    
    var delegate: ACMembersAnnouncementsViewModelDelegate? 
    
    //MARK: - Firebase Functions
    func loadAnnouncementsFromDB() async {
        loadedAnnouncements = []

        
        db.collection(Constants.FstoreDB.announcementsCollection)
            .order(by: Constants.FstoreDB.announcementDate, descending: true)
            .addSnapshotListener { querySnapshot, error in
                
                if let e = error {
                    print("Error retrieving data from Firestore: \(e)")
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        for document in snapshotDocuments {
                            let data = document.data()
                            if let announcementBody = data[Constants.FstoreDB.announcementBody] as? String,
                               let announcementDate = data[Constants.FstoreDB.announcementDate] as? Double
                            {
                                let newAnnouncement = ACAnnouncementModel(announcementDate: announcementDate, announcementBody: announcementBody)
                                self.loadedAnnouncements.append(newAnnouncement)
                                self.delegate?.didLoadAnnouncement()
                            }
                        }
                    }
                }
            }
    }
    
    
    //MARK: - Functions
    func formatDate(for date: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        let date = Date(timeIntervalSince1970: date)
        
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "HH:mm E, d MMM y"
        return dateFormatter.string(from: date)
    }
    
}

extension ACMembersAnnouncementsViewModel: UITableViewDataSource, UITableViewDelegate {
    //MARK: - TableView Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadedAnnouncements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViews.membersAnnouncementsTableViewCellIdentifier,
                                                 for: indexPath) as! ACMembersAnnouncementsTableViewCell
        
        let announcement = loadedAnnouncements[indexPath.row]
        let announcementDate = formatDate(for: announcement.announcementDate)
        cell.set(date: announcementDate, body: announcement.announcementBody)
        return cell
    }
}
