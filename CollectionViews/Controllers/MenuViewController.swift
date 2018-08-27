//
//  ViewController.swift
//  collections
//
//  Created by oscar on 27/08/2018.
//  Copyright © 2018 rosolowski. All rights reserved.
//

import UIKit

final class MenuViewController: UITableViewController {
    
    private let styles: [CollectionStyle] = [.carousel]
    private let flowController: FlowContoller = FlowContoller()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return styles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        let style = styles[indexPath.row]
        
        cell.textLabel?.text = style.rawValue
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let style = styles[indexPath.row]
        
        flowController.present(for: style, viewController: self)
    }
    
}

