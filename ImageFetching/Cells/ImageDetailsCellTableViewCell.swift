//
//  ImageDetailsCellTableViewCell.swift
//  ImageFetching
//
//  Created by Apple on 3/31/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

protocol ImageDetailsCellDelegate {
    func didSelectCell(at index: Int)
}

class ImageDetailsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    var delegate: ImageDetailsCellDelegate?
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        if let tag = (sender as? UIButton)?.tag {
            delegate?.didSelectCell(at: tag)
        }
    }
}
