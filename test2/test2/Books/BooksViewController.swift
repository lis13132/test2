//
//  BooksViewController.swift
//  test2
//
//  Created by Oleg Makarov on 18.11.2021.
//

import UIKit

class BooksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{


    @IBOutlet private weak var booksTableView: UITableView!
    
    let apiService = BookApiService()
    
    var books : [BookModel] = []
    
    var pageNumber = 1
    var totalItems = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Our Library"
        
        apiService.loadBooks(page: pageNumber, booksCallback: dataLoaded)
        
        booksTableView.dataSource = self
        booksTableView.delegate = self
        
        print("I am here")
        let cellNib = UINib(nibName: "BooksCell", bundle: nil) // Обращение к файлу верстки
        print(cellNib)
        booksTableView.register(cellNib, forCellReuseIdentifier: BooksCell.identifier)// дать этим ячейкам из букцелс идентификатор и дальше его в таблицу

    }

    private func dataLoaded(responce: BooksResponse?, error: Error?) {
        if let unwrapedError = error {
            print(unwrapedError)
        }
        
        totalItems = responce?.totalItems ?? 0
        
        if let apiBooks = responce?.books {
            books.append(contentsOf: apiBooks)
            print(books.count)
            DispatchQueue.main.async {
                self.booksTableView.reloadData()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        100 //Visota tablichki odnoi knigi
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell:UITableViewCell, forRowAt indexPath: IndexPath){
        let currentBookIndex = indexPath.row
        if currentBookIndex == books.count - 2 && totalItems > books.count {
            pageNumber += 1
            apiService.loadBooks(page: pageNumber, booksCallback: dataLoaded)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model = books[indexPath.row]
        let detailsVC = BookDetailsViewController(nibName: "BookDetailsViewController", bundle: nil)
        detailsVC.model = model
        navigationController?.pushViewController(detailsVC, animated: false)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BooksCell.identifier) as? BooksCell else {return UITableViewCell() }
        
//        print("I in table view")
        //Sozdat yacheyky dlya indexa
        let model = books[indexPath.row]
        cell.setup(model: model)
        return cell
    }
    

}
