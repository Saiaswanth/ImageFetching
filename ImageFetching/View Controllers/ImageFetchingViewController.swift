//
//  ImageFetchingViewController.swift
//  ImageFetching
//
//  Created by Apple on 3/31/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ImageFetchingViewController: UIViewController {

    let viewModel = ImageFetchingViewModel()
    
    @IBOutlet weak var marvelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    private func updateUI() {
        viewModel.fetchData()
        viewModel.updateClousure = { [weak self] in
            
            guard let weakSelf = self else { return }
            DispatchQueue.main.async {
                weakSelf.marvelTableView.reloadData()
            }
        }
    }
    
    private func getCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let characterDetails = viewModel.getCharacterDetails(at: indexPath.row)
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ImageFetchingCell", for: indexPath) as? ImageDetailsCellTableViewCell, let imageUrl = characterDetails.imageurl, let characterName = characterDetails.name {
            cell.characterImageView.loadImage(from: imageUrl)
            cell.characterName.text = characterName
            cell.nextButton.tag = indexPath.row
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let characterDetailsViewController = segue.destination as? CharacterDetailsViewController
        if let sender = sender as? Int, let imageUrl = viewModel.getCharacterImageUrl(at: sender)  {
            characterDetailsViewController?.characterImageUrl = imageUrl
        }
    }
}

extension ImageFetchingViewController: ImageDetailsCellDelegate {
    
    func didSelectCell(at index: Int) {
        performSegue(withIdentifier: "CharacterDetailsViewController", sender: index)
    }
}

extension ImageFetchingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getCell(for:tableView, at:indexPath)
    }
}

