//
//  ViewController.swift
//  ToDo_List
//
//  Created by Geo Aldana on 4/16/21.
//
import RealmSwift
import UIKit

class ToDoListItem: Object {
    @objc dynamic var item: String = ""
    @objc dynamic var date: Date = Date()
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var color_counter = 0;
    
    private var realm = try! Realm()
    private var data = [ToDoListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        data = realm.objects(ToDoListItem.self).map({ $0 })
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = data[indexPath.row].item
            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)

            // Open the screen where we can see item info and dleete
            let item = data[indexPath.row]
            
            guard let vc = storyboard?.instantiateViewController(identifier: "view") as? ViewViewController else {
                return
            }
            
            vc.item = item
            vc.deletionHandler = { [weak self] in
                self?.refresh()
            }
            vc.navigationItem.largeTitleDisplayMode = .never
            vc.title = item.item
            navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func didTapADDButton() {
        guard let vc = storyboard?.instantiateViewController(identifier: "enter") as? EntryViewController else{
            return
        }
        vc.completionHandler = { [weak self] in
            self?.refresh()
        }
        vc.title = "New Item"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func changeColor(_ sender: UIButton) {
        view.backgroundColor = UIColor.blue
        
        if color_counter == 0 {
            view.backgroundColor = UIColor.gray
            table.backgroundColor=UIColor.lightGray
        } else if color_counter == 1 {
            view.backgroundColor = UIColor.white
            table.backgroundColor=UIColor.white
            color_counter = 0;
            return;
        }
        color_counter += 1;
    }
    

    func refresh() {
        data = realm.objects(ToDoListItem.self).map({ $0 })
        table.reloadData()
    }

}
