//
//  ViewController.swift
//  collections
//
//  Created by Oskar Rosolowski on 27/08/2018.
//  Copyright © 2018 Oskar Rosolowski. All rights reserved.
//

import UIKit

final class MenuViewController: UITableViewController {
    private let flowController: FlowContoller = FlowContoller()
    
    private var styles: [CollectionStyle] {
        return [
            .carousel,
            .horizontalCarousel,
            .stretchyHeader,
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Layouts"
    }
    
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
