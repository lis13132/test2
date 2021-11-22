//
//  BooksCell.swift
//  test2
//
//  Created by Oleg Makarov on 18.11.2021.
//

import UIKit

class BooksCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    static let identifier = "BooksCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(model: BookModel){
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        authorLabel.text = model.author
        
        
    }
}
