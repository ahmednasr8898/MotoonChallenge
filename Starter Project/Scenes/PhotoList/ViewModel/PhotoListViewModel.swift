//
//  PhotoListViewModel.swift
//  Starter Project
//
//  Created by Ahmed Nasr on 29/03/2023.
//

import Foundation


class PhotoListViewModel {
    
    ///reload collection view
    ///
    var bindToReloadCollectionViewClosure: (() -> Void)?
    var photoList: PhotoListModel = [] {
        didSet {
            bindToReloadCollectionViewClosure?()
        }
    }
    
    ///bind to error services
    ///
    var bindToErrorServiceClosure: (() -> Void)?
    var error: Error? {
        didSet {
            bindToErrorServiceClosure?()
        }
    }
    
    ///init
    ///
    init() {
        fetchPhotoList()
    }
    
    ///get cell count
    ///
    func getNumberOfCells() -> Int {
        return photoList.count
    }
    
    ///get cell model
    ///
    func getCell(indexPath: IndexPath) -> PhotoListModelElement {
        return photoList[indexPath.row]
    }
}

//MARK:  - fetch photo list -
//
extension PhotoListViewModel {
    ///fetch list of photos
    ///
    private func fetchPhotoList() {
        Repositories.shared.photoList { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                
            case .success(let list):
                guard let list = list else { return }
                self.photoList = list
            case .failure(let error):
                self.error = error
            }
        }
    }
}
