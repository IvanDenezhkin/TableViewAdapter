# TableViewAdapter
Leave your tableview boilerplate code in the past - use tableview adapter

init with nib cell
```swift
let adapter = TableViewAdapter<NibTableViewCell, CustomModel>(withTableView: self.customTableView, items: items) { item, cell in
            cell.nameLabel.text = item.name
        }
```
