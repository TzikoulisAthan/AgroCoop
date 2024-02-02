//
//  ACNewsModel.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 31/1/24.
//

import UIKit

struct ACNewsModel: Codable {
    var articles: [Article]
}

struct Article: Codable {
    var title: String
    var content: String
    
}

