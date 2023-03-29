//
//  PhotoListViewController.swift
//  Starter Project
//
//  Created by Ahmed Nasr on 29/03/2023.
//

import UIKit

class PhotoListViewController: UIViewController {

    //MARK: - outlets -
    //
    @IBOutlet weak var photoListCollectionView: UICollectionView!
    
    //MARK: - variables -
    //
    private let viewModel = PhotoListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCategoryCollectionView()
        bindToReloadCollectionView()
        bindToErrorServices()
    }
}


//MARK: - set up collection view -
//
extension PhotoListViewController {
    private func setupCategoryCollectionView() {
        photoListCollectionView.register(PhotoCollectionViewCell.nib(), forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        photoListCollectionView.delegate = self
        photoListCollectionView.dataSource = self
    }
}


//MARK: - reload collection view -
//
extension PhotoListViewController {
    private func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.photoListCollectionView.reloadData()
        }
    }
}


//MARK: - bind to reload collection view -
//
extension PhotoListViewController {
    private func bindToReloadCollectionView() {
        viewModel.bindToReloadCollectionViewClosure = { [weak self] in
            guard let self = self else { return }
            self.reloadCollectionView()
        }
    }
}


//MARK: - bind to error services -
//
extension PhotoListViewController {
    private func bindToErrorServices() {
        viewModel.bindToErrorServiceClosure = { [weak self] in
            guard let self = self else { return }
            Alert.failedToConnectWithServerAlert(on: self)
        }
    }
}


//MARK: - number of cells -
//
extension PhotoListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfCells()
    }
}


//MARK: - dequeue cell -
//
extension PhotoListViewController {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        cell.configureCell(model: viewModel.getCell(indexPath: indexPath))
        return cell
    }
}


//MARK: - did select item -
//
extension PhotoListViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = SelectedPhotoViewController()
        viewController.id = viewModel.getCell(indexPath: indexPath).id
        navigationController?.pushViewController(viewController, animated: true)
    }
}


//MARK: - size of cells -
//
extension PhotoListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.44 , height: self.view.frame.width * 0.44)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return view.frame.width * (10 / 375)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: self.view.frame.width * (16 / 375), bottom: 8, right: self.view.frame.width * (16 / 375))
    }
}

