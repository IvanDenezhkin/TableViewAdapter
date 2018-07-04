//
//  TableViewAdapter.swift
//  Demo
//
//  Created by Ivan Denezhkin on 04.07.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class TableViewAdapter<T: UITableViewCell, U>: NSObject, UITableViewDataSource, UITableViewDelegate {
    let tableView: UITableView
    var items: [U]
    var cellHeight: CGFloat = 44
    let cellID = "AdapterCellID"
    var binder: ((_ item: U, _ cell: T) -> ())
    
    init(withTableView tableView: UITableView, items: [U], binder: @escaping ((_ item: U, _ cell: T) -> ())) {
        self.tableView = tableView
        self.items = items
        self.binder = binder
        super.init()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "\(T.self)", bundle: nil), forCellReuseIdentifier: cellID)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! T
        self.binder(items[indexPath.row], cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
}
