//
//  ViewController.swift
//  Pass Value Work
//
//  Created by FISH on 2020/1/15.
//  Copyright © 2020 FISH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = ["2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func add(_ sender: Any) {
        let vc = SecondViewController()
        vc.pass = addCell(input:index:)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func deleteCell(sender: UIButton) {
        if let cell = sender.superview?.superview as? TableViewCell, let deleteIndexPath = tableView.indexPath(for: cell) {
            data.remove(at: deleteIndexPath.row)
            tableView.deleteRows(at: [deleteIndexPath], with: .automatic)
        }
    }
    
    func addCell(input: String, index: Int?) {
        if let index = index {
            data[index] = input
            tableView.reloadData()
        } else {
            data.append(input)
            tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        cell.label.text = data[indexPath.row]
        cell.delegate = self
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SecondViewController()
        vc.selectedIndex = indexPath.row
        vc.inputTextField.text = data[indexPath.row]
        vc.pass = addCell(input:index:)
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }

}

extension ViewController: TableViewCellDelegate {
    
    func pass(_ tableViewCell: TableViewCell) {
        if let indexPath = tableView.indexPath(for: tableViewCell) {
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
