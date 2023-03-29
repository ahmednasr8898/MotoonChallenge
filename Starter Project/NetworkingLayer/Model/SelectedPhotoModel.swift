//
//  SelectedPhotoModel.swift
//  Starter Project
//
//  Created by Ahmed Nasr on 29/03/2023.
//

import Foundation

// MARK: - SelectedPhotoModel
struct SelectedPhotoModel: Codable {
    let width, height: Int
    let urls: PhotoUrls
   

    enum CodingKeys: String, CodingKey {
        case width, height
        case urls
    }
}
