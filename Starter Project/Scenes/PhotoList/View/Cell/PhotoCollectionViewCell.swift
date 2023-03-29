//
//  PhotoCollectionViewCell.swift
//  Starter Project
//
//  Created by Ahmed Nasr on 29/03/2023.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    //MARK: - outlets -
    //
    @IBOutlet weak var myImageView: UIImageView!
    
    //MARK: - variables -
    //
    static let identifier = "PhotoCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "PhotoCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesign()
    }
    
    private func setupDesign() {
        myImageView.layer.cornerRadius = 12
    }
    
    func configureCell(model: PhotoListModelElement) {
        myImageView.downloaded(from: model.urls.full)
    }
}
