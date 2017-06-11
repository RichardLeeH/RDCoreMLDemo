//
//  MasterViewController.swift
//  RDCoreMLDemo
//
//  Created by lihui on 2017/6/11.
//  Copyright © 2017年 org.richard. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController
{
    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    var plistObjects = [mlPlistModel]();

    override func viewDidLoad()
    {
        super.viewDidLoad()
//        if let split = splitViewController
//        {
//            let controllers = split.viewControllers
//            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
//        }
        
        self._setupUI();
    }
    
    private func _setupUI()
    {
        self._readPlistData();
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showDetail"
        {
            if let indexPath = tableView.indexPathForSelectedRow
            {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return plistObjects.count;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let object:mlPlistModel = plistObjects[indexPath.row]
        
        let controllerName="RDCoreMLDemo." + object.vcName  // xibName 形如 XXViewController
        var classType: AnyObject.Type = NSClassFromString(controllerName)!
        var nsobjectype : UIViewController.Type = classType as! UIViewController.Type
        var viewController: UIViewController = nsobjectype.init(nibName: object.vcName, bundle: nil)
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object:mlPlistModel = plistObjects[indexPath.row]
        cell.textLabel!.text = object.name+"-"+object.className;
        return cell
    }
    
    private func _readPlistData()
    {
        let array:NSArray? = RDBundle.readBundle("ml");
        if let array = array
        {
            for dic in array
            {
                var item:mlPlistModel = mlPlistModel();
                item.name = (dic as! NSDictionary).value(forKey: "name") as! String;
                item.className = (dic as! NSDictionary).value(forKey: "className") as! String;
                item.vcName = (dic as! NSDictionary).value(forKey: "vcName") as! String;
                
                self.plistObjects.append(item);
            }
        }
    }
}

