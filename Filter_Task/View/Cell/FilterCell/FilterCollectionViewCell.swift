//
//  FilterCollectionViewCell.swift
//  Filter_Task
//
//  Created by 3rabApp-oday on 20/08/2023.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var filterTumbnailImageView: UIImageView!
     var image:CIImage?
    let context                 = CIContext(options: nil)
    var imageRef:CGImage?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func createTumbnails(originalImage:UIImage , filter:Filters){
          originalImage.createThumbnail(scaleTo: 0.25){ [weak self] thumbnailImage in
              guard let self  , let thumbnailImage = thumbnailImage else {return}
              self.image = CIImage(cgImage: (thumbnailImage.cgImage!))
              
              switch filter {
              case .Filter1:
                  let filter = Filter1()
                  filter.inputImage = self.image
                  self.imageRef = self.context.createCGImage(filter.outputImage()!, from:self.image!.extent)
              case .Filter2:
                  let filter = Filter2()
                  filter.inputImage = self.image
                  self.imageRef = self.context.createCGImage(filter.outputImage()!, from:self.image!.extent)
              case .Filter3:
                  let filter = Filter3()
                  filter.inputImage = self.image
                  self.imageRef = self.context.createCGImage(filter.outputImage()!, from:self.image!.extent)
              case .Filter4:
                  let filter = Filter4()
                  filter.inputImage = self.image
                  self.imageRef = self.context.createCGImage(filter.outputImage()!, from:self.image!.extent)
              case .Filter5:
                  let filter = Filter5()
                  filter.inputImage = self.image
                  self.imageRef = self.context.createCGImage(filter.outputImage()!, from:self.image!.extent)
              }
              self.ApplyFilterOnThumbnail()
        }
    }
    
    private func ApplyFilterOnThumbnail(){
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.filterTumbnailImageView.image = UIImage(cgImage: self.imageRef!)
        }
    }
}
