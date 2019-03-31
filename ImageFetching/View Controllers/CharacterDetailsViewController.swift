//
//  CharacterDetailsViewController.swift
//  ImageFetching
//
//  Created by Apple on 3/31/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class CharacterDetailsViewController: UIViewController {

    var characterImageUrl: String?
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    private func updateUI() {
        if let imageUrl = characterImageUrl {
            characterImageView.loadImage(from: imageUrl)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
