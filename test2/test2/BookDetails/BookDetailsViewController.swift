//
//  BookDetailsViewController.swift
//  test2
//
//  Created by Oleg Makarov on 21.11.2021.
//

import UIKit

class BookDetailsViewController: UIViewController {

    @IBOutlet  private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    
    var model: BookModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = model?.title
        descriptionLabel.text = model?.description
        authorLabel.text = model?.author
        
    }

}
