//
//  DetailViewController.swift
//  BeerApp
//
//  Created by Jerry Zhou on 5/9/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailidLabel: UILabel!
    @IBOutlet weak var detailNameLabel: UILabel!
    
    static let identifier = "DetailViewController"
    
    var beer : Beer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        guard let beerToShow = beer else{
            return
        }
        
        detailNameLabel.text = "Name: " + beerToShow.name
        detailidLabel.text = "ID: " + beerToShow.id
        
        DLService.downloadImage(url: beerToShow.imageUrl) { [unowned self] img in
            let image = img == nil ? UIImage(named: "beer") : img
            
            DispatchQueue.main.async {
                self.detailImage.image = image!
            }
        }
        
    }
}
