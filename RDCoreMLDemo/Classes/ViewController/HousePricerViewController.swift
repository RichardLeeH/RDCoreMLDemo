//
//  HousePricerViewController.swift
//  RDCoreMLDemo
//
//  Created by lihui on 2017/6/11.
//  Copyright © 2017年 org.richard. All rights reserved.
//

import UIKit

class HousePricerViewController: BaseViewController
{
    let model = HousePricer()

    @IBOutlet weak var resultLabel:UILabel!
    @IBOutlet weak var sizeTextField:UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func setupUI()
    {
        self.sizeTextField.text = "0";
    }
    
    override func setupEvent()
    {
        self.sizeTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControlEvents.editingChanged)
    }
    
    override func readNavTitle() -> String
    {
        return "HousePricer";
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @objc func textFieldChanged()
    {
        var text:String = self.sizeTextField.text ?? "0";
        var size:Double = (text as NSString).doubleValue;
        let input = HousePricerInput(Square_Feet: size);
        guard let marsHabitatPricerOutput = try? model.prediction(input:input) else {
            fatalError("Unexpected runtime error.")
        }
        
        let price = marsHabitatPricerOutput.Price
        
        let Str:String = "The price is \(price)"
        self.resultLabel.text = Str;
    }
}
