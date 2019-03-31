//
//  ImageFetchingViewModel.swift
//  ImageFetching
//
//  Created by Apple on 3/31/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ImageFetchingViewModel {
    
    let networkManager = NetworkManager()
    private var marvelModels = [MarvelModel]()
    var updateClousure:(()->())?

    func fetchData() {
        networkManager.getRequest(from: "https://simplifiedcoding.net/demos/marvel/", success: { [weak self] response in
            
            guard let weakSelf = self else { return }
            weakSelf.marvelModels = response
            weakSelf.updateClousure?()
        }) { errorResponse in
            
        }
    }
    
    func getNumberOfRows() -> Int {
        return marvelModels.count
    }
    
    func getCharacterDetails(at index: Int) -> MarvelModel {
        return marvelModels[index]
    }
    
    func getCharacterImageUrl(at index: Int) -> String? {
        return marvelModels[index].imageurl
    }

}
