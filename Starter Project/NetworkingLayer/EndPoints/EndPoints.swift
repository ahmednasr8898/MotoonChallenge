//
//  EndPoints.swift
//  Starter Project
//
//  Created by Ahmed Nasr on 29/03/2023.
//

import Foundation

class EndPoints {
    
    static let shared = EndPoints()
    private init() {}
    
    var baseURL = "https://api.unsplash.com/"
}

//MARK: - photo list -
//
extension EndPoints {
    func photoList()-> URL? {
        return URL(string: baseURL + "photos")
    }
}

//MARK: - selected photo -
//
extension EndPoints {
    func selectedPhoto(id: String)-> URL? {
        return URL(string: baseURL + "photos/\(id)")
    }
}

