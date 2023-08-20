//
//  Constant.swift
//  Filter_Task
//
//  Created by 3rabApp-oday on 20/08/2023.
//

import Foundation


enum Cell {
    static let filterCell = "FilterCollectionViewCell"
}

enum Filters {
    static let filtersModel:[FilterModel] = [FilterModel(filterName: "CIPhotoEffectChrome") ,
                                        FilterModel(filterName: "CIPhotoEffectFade"),
                                        FilterModel(filterName: "CIPhotoEffectInstant"),
                                        FilterModel(filterName: "CIPhotoEffectMono"),
                                        FilterModel(filterName: "CIPhotoEffectNoir"),
                                        FilterModel(filterName: "CIPhotoEffectProcess"),
                                        FilterModel(filterName: "CIPhotoEffectTonal"),
                                        FilterModel(filterName: "CIPhotoEffectTransfer")
           ]
}


