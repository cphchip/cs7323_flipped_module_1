//
//  TableViewController.swift
//  flipped_module_1_smith_davis_hendersonExample
//
//  Created by Eric Larson on 9/3/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//
// Revisions:
// Smith,Davis,Henderson: updated for Flipped Assignment 1

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    lazy var imageModel:ImageModel = {
        return ImageModel.sharedInstance()
    }()

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            //return self.imageModel.imageNames.count
            //Wilma added (since property imageNames is now private
            return self.imageModel.numberOfImages()
        }
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNameCell", for: indexPath)
            
            // Configure the cell...
            //REMOVED:  if let name = self.imageModel.imageNames[indexPath.row] as? String {
            
            //Wilma updated ( since @property imageNames is now private
            //REMOVED:  if let name = self.imageModel.getImageName(for: indexPath.row) as? String{
                //REMOVED:   cell.textLabel!.text = name
            cell.textLabel!.text = self.imageModel.getImageName(for: indexPath.row);
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath)
            
            // Configure the cell...
            cell.textLabel?.text = "All Image"
            cell.detailTextLabel?.text = "Summary"
            
            return cell
        }
    }
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let vc = segue.destination as? ViewController,
           let cell = sender as? UITableViewCell,
           let name = cell.textLabel?.text {
                vc.displayImageName = name
        }
    }
    

}
