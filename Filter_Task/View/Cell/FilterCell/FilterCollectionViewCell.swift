//
//  FilterCollectionViewCell.swift
//  Filter_Task
//
//  Created by 3rabApp-oday on 20/08/2023.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var filterTumbnailImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func createTumbnails(originalImage:UIImage , filter:String){
          originalImage.createThumbnail(scaleTo: 0.25){ [weak self] thumbnailImage in
              guard let self  , let thumbnailImage = thumbnailImage else {return}
              self.ApplyFilterOnThumbnail(thumbnailImage: thumbnailImage, filterName: filter)
        }
    }
    
    private func ApplyFilterOnThumbnail(thumbnailImage:UIImage,filterName:String){
        let thumbnail =  thumbnailImage.addFilter(filter: filterName)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.filterTumbnailImageView.image = thumbnail
        }
    }
}
