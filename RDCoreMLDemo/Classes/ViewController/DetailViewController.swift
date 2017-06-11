//
//  DetailViewController.swift
//  RDCoreMLDemo
//
//  Created by lihui on 2017/6/11.
//  Copyright © 2017年 org.richard. All rights reserved.
//

import UIKit

import CoreML

class DetailViewController: UIViewController
{
    let model = HousePricer()
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        
        let input = HousePricerInput(Square_Feet: 1500);
        guard let marsHabitatPricerOutput = try? model.prediction(input:input) else {
            fatalError("Unexpected runtime error.")
        }
        
        let price = marsHabitatPricerOutput.Price
        print("1500 size price = \(price)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

