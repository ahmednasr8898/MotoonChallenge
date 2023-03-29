//
//  SelectedPhotoViewModel.swift
//  Starter Project
//
//  Created by Ahmed Nasr on 29/03/2023.
//

import Foundation


class SelectedPhotoViewModel {
    
    ///bind to selected photo
    ///
    var bindToSelectedPhotoClosure: (() -> Void)?
    var photo: String? {
        didSet {
            bindToSelectedPhotoClosure?()
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
}

//MARK:  - fetch selected photo -
//
extension SelectedPhotoViewModel {
    ///fetch selected photos
    ///
    func fetchSelectedPhoto(id: String) {
        Repositories.shared.selectedPhoto(id: id) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let photo):
                self.photo = photo?.urls.full
            case .failure(let error):
                self.error = error
            }
        }
    }
}

