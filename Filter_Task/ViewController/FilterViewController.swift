//
//  ViewController.swift
//  Filter_Task
//
//  Created by 3rabApp-oday on 20/08/2023.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    
    var originalImage           = UIImage(named: "nature_Image")
    lazy var image              = CIImage(cgImage: (mainImageView.image?.cgImage)!)
    let context                 = CIContext(options: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        filterCollectionView.delegate       = self
        filterCollectionView.dataSource     = self
        filterCollectionView.register(UINib(nibName: Cell.filterCell, bundle: nil), forCellWithReuseIdentifier: Cell.filterCell)
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        mainImageView.image = originalImage
    }
    @IBAction func saveBtnPressed(_ sender: Any) {
        guard let image = mainImageView.image else {return}
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    //MARK: - Add image to Library
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let errorAlert = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .default))
            present(errorAlert, animated: true)
        } else {
            let successAlert = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            successAlert.addAction(UIAlertAction(title: "OK", style: .default))
            present(successAlert, animated: true)
        }
    }
    
}



// MARK: - Collection View
extension FilterViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width   = collectionView.frame.size.width / 4
        let height  =  collectionView.frame.size.height
        return CGSize(width:width, height:height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: Cell.filterCell, for: indexPath) as? FilterCollectionViewCell else {return UICollectionViewCell()}
        cell.createTumbnails(originalImage: originalImage ?? UIImage(), filter: Filters.allCases[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var imageRef:CGImage?
        if indexPath.row == 0 {
             let filter = Filter1()
            filter.inputImage = image
             imageRef = context.createCGImage(filter.outputImage()!, from:image.extent)
        }else if indexPath.row == 1{
            let filter = Filter2()
            filter.inputImage = image
             imageRef = context.createCGImage(filter.outputImage()!, from:image.extent)
        }else if indexPath.row == 2{
            let filter = Filter3()
            filter.inputImage = image
            imageRef = context.createCGImage(filter.outputImage()!, from:image.extent)
        }else if indexPath.row == 3{
            let  filter = Filter4()
            filter.inputImage = image
             imageRef = context.createCGImage(filter.outputImage()!, from:image.extent)
        }else if indexPath.row == 4{
            let filter = Filter5()
            filter.inputImage = image
            imageRef = context.createCGImage(filter.outputImage()!, from:image.extent)
        }
        mainImageView.image = UIImage(cgImage: imageRef!)
    }
}
