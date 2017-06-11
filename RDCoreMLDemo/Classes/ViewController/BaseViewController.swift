//
//  BaseViewController.swift
//  RDCoreMLDemo
//
//  Created by lihui on 2017/6/11.
//  Copyright © 2017年 org.richard. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController:UIViewController
{
    deinit
    {
        self.removeEvent();
        self.removeNotify();
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        self.title = self.readNavTitle();
        self.setupUI();
        self.setupEvent();
        self.setupNotify();
    }
    
    func setupUI()
    {
    }
    
    func setupEvent()
    {
        
    }
    
    func setupNotify()
    {
        
    }
    
    func removeNotify()
    {
        
    }
    
    func removeEvent()
    {
        
    }
    
    func readNavTitle() -> String
    {
        return "";
    }
}
