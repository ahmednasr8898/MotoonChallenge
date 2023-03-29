//
//  Repositories.swift
//  Starter Project
//
//  Created by Ahmed Nasr on 29/03/2023.
//

import Foundation

class Repositories {
    static let shared = Repositories()
    private init() {}
}


//MARK: - photo list -
//
extension Repositories {
    func photoList(completion: @escaping (Result<PhotoListModel?, Error>) -> Void) {
        Networking.shared.connectToServer(EndPoint: EndPoints.shared.photoList()!, method: .get) { result in
            completion(result)
        }
    }
}


//MARK: - selected photo -
//
extension Repositories {
    func selectedPhoto(id: String, completion: @escaping (Result<SelectedPhotoModel?, Error>) -> Void) {
        Networking.shared.connectToServer(EndPoint: EndPoints.shared.selectedPhoto(id: id)!, method: .get) { result in
            completion(result)
        }
    }
}
