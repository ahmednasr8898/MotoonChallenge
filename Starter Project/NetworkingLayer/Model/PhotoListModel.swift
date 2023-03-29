//
//  PhotoListModel.swift
//  Starter Project
//
//  Created by Ahmed Nasr on 29/03/2023.
//

import Foundation

typealias PhotoListModel = [PhotoListModelElement]

// MARK: - PhotoListModelElement
struct PhotoListModelElement: Codable {
    let id: String
    let urls: PhotoUrls
    
    enum CodingKeys: String, CodingKey {
        case id, urls
    }
}

// MARK: - Urls
struct PhotoUrls: Codable {
    let full: String
    
    enum CodingKeys: String, CodingKey {
        case full
    }
}


