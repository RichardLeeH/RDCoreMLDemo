//
//  RDBundle.swift
//  RDCoreMLDemo
//
//  Created by lihui on 2017/6/11.
//  Copyright © 2017年 org.richard. All rights reserved.
//

import Foundation

final class RDBundle
{
    static func readBundle(_ aName:String) -> NSArray?
    {
        let path:String = Bundle.main.path(forResource: aName, ofType: "plist")!;
        return NSArray(contentsOfFile: path);
    }
}
