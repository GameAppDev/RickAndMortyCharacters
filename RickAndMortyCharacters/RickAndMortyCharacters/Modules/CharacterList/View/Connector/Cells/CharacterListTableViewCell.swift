//
//  CharacterListTableViewCell.swift
//  RickAndMortyCharacters
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import UIKit

final class CharacterListTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var speciesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureCell(with character: Characters) {
        setupViews()
        characterImageView.downloadImage(imageKey: character.image, defaultImage: "DefaultListImage")
        nameLabel.text = character.name
        statusLabel.text = character.status
        speciesLabel.text = character.species
    }
    
    fileprivate func setupViews() {
        containerView.roundCorners(size: CGFloat(10).ws)
        containerView.backgroundColor = UIColor.cardColour
        nameLabel.font = UIFont.titleFont
        nameLabel.textColor = UIColor.titleColour
        statusLabel.font = UIFont.textFont
        statusLabel.textColor = UIColor.textColor
        speciesLabel.font = UIFont.textFont
        speciesLabel.textColor = UIColor.textColor
    }
}
