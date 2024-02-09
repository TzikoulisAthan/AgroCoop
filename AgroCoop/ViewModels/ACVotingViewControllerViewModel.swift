//
//  ACVotingViewControllerViewModel.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 9/2/24.
//

import UIKit
import FirebaseFirestore

protocol ACVotingViewControllerViewModelDelegate {
    func didLoadVotingSubjects()
}

final class ACVotingViewControllerViewModel: NSObject {
    
    //MARK: - Variable declarations
    private let db = Firestore.firestore()
    
    private var loadedVotingSubjects = [ACVotingSubjectModel]()
    
    var delegate: ACVotingViewControllerViewModelDelegate?
    
    //MARK: - Firebase functions
    func loadVotingSubjectsFromDB() async {
        loadedVotingSubjects = []
        
        db.collection(Constants.FstoreDB.votingSubjectCollection)
            .addSnapshotListener { querySnapshot, error in
                
                if let e = error {
                    print("Error retrieving data from Firestore: \(e)")
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        for document in snapshotDocuments {
                            let data = document.data()
                            if let votingSubjectBody = data[Constants.FstoreDB.votingSubjectBody] as? String,
                               let votingSubjectDate = data[Constants.FstoreDB.votingSubjectDate] as? Double, 
                                let votesPro = data[Constants.FstoreDB.votesPro] as? Int, 
                                let votesCon = data[Constants.FstoreDB.votesCon] as? Int
                            {
                                let newVotingSubject = ACVotingSubjectModel(votingSubjectDate: votingSubjectDate, votingSubjectBody: votingSubjectBody, votesPro: votesPro, votesCon: votesCon)
                                
                                self.loadedVotingSubjects.append(newVotingSubject)
                                self.delegate?.didLoadVotingSubjects()
                                
                            }
                        }
                    }
                }
            }
    }
    
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

extension ACVotingViewControllerViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadedVotingSubjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViews.votingTableViewCellIdentifier, for: indexPath) as! ACVotingTableViewCell
        
        let votingSubject = loadedVotingSubjects[indexPath.row]
        let votingSubjectDate = formatDate(for: votingSubject.votingSubjectDate)
        cell.set(date: votingSubjectDate, body: votingSubject.votingSubjectBody)
        
        return cell
    }
    
    
}
