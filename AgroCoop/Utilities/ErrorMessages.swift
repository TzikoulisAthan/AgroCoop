//
//  ACError.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 31/1/24.
//

import Foundation

enum ACError: String, Error {
    case invalidUrl = "URL is invalid"
    case unableToComplete = "Unable to complete"
    case corruptedData = "Data are corrupted ffs"
}
