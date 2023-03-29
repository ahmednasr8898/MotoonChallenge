//
//  SelectedPhotoViewController.swift
//  Starter Project
//
//  Created by Ahmed Nasr on 29/03/2023.
//

import UIKit

class SelectedPhotoViewController: UIViewController {

    //MARK: - outlets -
    //
    @IBOutlet weak var selectedImageView: UIImageView!
    
    //MARK: - variables -
    //
    var id: String?
    private let viewModel = SelectedPhotoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
        fetchSelectedPhoto()
        bindToSelectedPhoto()
        bindToErrorServices()
    }
}


//MARK: - setup design -
//
extension SelectedPhotoViewController {
    private func setUpDesign() {
        self.selectedImageView.layer.cornerRadius = 12
    }
}

//MARK: - fetch selected photo -
//
extension SelectedPhotoViewController {
    private func fetchSelectedPhoto() {
        guard let id = self.id else { return }
        viewModel.fetchSelectedPhoto(id: id)
    }
}


//MARK: - bind to selected photo -
//
extension SelectedPhotoViewController {
    private func bindToSelectedPhoto() {
        viewModel.bindToSelectedPhotoClosure = { [weak self] in
            guard let self = self else { return }
            self.selectedImageView.downloaded(from: self.viewModel.photo ?? "")
        }
    }
}


//MARK: - bind to error services -
//
extension SelectedPhotoViewController {
    private func bindToErrorServices() {
        viewModel.bindToErrorServiceClosure = { [weak self] in
            guard let self = self else { return }
            Alert.failedToConnectWithServerAlert(on: self)
        }
    }
}
