//
//  Utils.swift
//  ImageFetching
//
//  Created by Apple on 3/31/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadImage(from urlString: String) {
        guard let urlFromString = URL(string: urlString) else {return}
        DispatchQueue.global().async { [weak self] in
            
            guard let weakSelf = self else { return }
            
            if let data = try? Data(contentsOf: urlFromString) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        weakSelf.image = image
                    }
                }
            }
        }
    }
}
