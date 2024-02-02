//
//  ACNewsViewControllerViewModel.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 31/1/24.
//

import UIKit

protocol ACNewsViewControllerViewModelViewDelegate {
    func didLoadNews()
    /// Notifies the view that a cell was selected and passes the data of the cell
    /// - Parameters:
    ///   - articleTitle: <#articleTitle description#>
    ///   - articleBody: <#articleBody description#>
    func didSelectArticle(articleTitle: String, articleBody: String)
}

class ACNewsViewControllerViewModel: NSObject {
    
    //MARK: - Variable declaration
    var delegate: ACNewsViewControllerViewModelViewDelegate?
    var newsArray = [ACNewsModel]()
    var articleTitles = [String]()
    var articleContent = [String]()
    
    //MARK: - Functions
    
    /// Function responsible for decoding the json and returning the news articles
    /// - Parameter completed: Return type
    func loadNews(completed: @escaping(Result<ACNewsModel, ACError>) -> Void) {

        
        guard let url = URL(string: Constants.urls.newsApiBaseURL) else {
            completed(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            
            guard let data = data else {
                completed(.failure(.unableToComplete))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let news = try decoder.decode(ACNewsModel.self, from: data)
                completed(.success(news))
                DispatchQueue.main.async {
                    self.delegate?.didLoadNews()
                }
            } catch {
                completed(.failure(.corruptedData))
            }
        }
        
        task.resume()
    }
    
    func getNews() {
        loadNews { result in
            
            switch result {
            case .success(let news):
                for i in 0...news.articles.count-1 {
                    self.newsArray.append(news)
                    self.articleTitles.append(news.articles[i].title)
                    self.articleContent.append(news.articles[i].content)
                }
                
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}


extension ACNewsViewControllerViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViews.newsTableViewCellIdentifier,
                                                 for: indexPath) as! ACNewsTableViewCell
        
        
        cell.set(title: articleTitles[indexPath.row], body: articleContent[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectArticle(articleTitle: articleTitles[indexPath.row], articleBody: articleContent[indexPath.row] )
    }
    
    
}
