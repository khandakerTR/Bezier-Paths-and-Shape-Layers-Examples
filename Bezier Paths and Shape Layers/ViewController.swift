//
//  ViewController.swift
//  Bezier Paths and Shape Layers
//
//  Created by Tushar Khandaker on 11/8/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var demoView: containerView!
    
    var get = 0 {
        didSet {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShapeType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = "\(ShapeType.allCases[indexPath.item])"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        demoView.currentShape = ShapeType.allCases[indexPath.item]
    }
}
