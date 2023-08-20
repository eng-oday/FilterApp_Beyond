//
//  UiimageView+Ext.swift
//  Filter_Task
//
//  Created by 3rabApp-oday on 20/08/2023.
//

import Foundation
import UIKit

extension UIImage {
    // MARK: -  THUMBNAIL
     func createThumbnail(scaleTo scaleValue: CGFloat,completion: @escaping (_ thumbnail: UIImage?) -> Void ) {

         // 1. APPLY THE PROCCESS ON BACKGROUND THREAD
        DispatchQueue.global(qos: .background).async {

            //2. GET THE IMAGE DATA
            guard let imageData = self.jpegData(compressionQuality: 1) else {
                completion(nil)
                return
            }
            // 3. CREATE IMAGE SOURCE OBJECT USING IMAGE DATA
            guard let imageSource = CGImageSourceCreateWithData(imageData as CFData, nil) else {
                completion(nil)
                return
            }

            // 4. SPECIFY THUMBNAIL SIZE .
            let thumbnailSize = max(self.size.width, self.size.height) * scaleValue

            // 5. CREAT DICTIOANRY WITH MINIMUM RECOMMENDED OPTIONS
            let options = [
                kCGImageSourceThumbnailMaxPixelSize: thumbnailSize,
                kCGImageSourceCreateThumbnailWithTransform: true,
                kCGImageSourceCreateThumbnailFromImageAlways: true
            ] as CFDictionary

            // 6. GENERAT THUMBNAIL
            guard let thumbnail = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options) else {
                completion(nil)
                return
            }
            // 7. PASS IT TO COMPLETION HANDLER
            completion(UIImage(cgImage: thumbnail))
        }
    }

}
