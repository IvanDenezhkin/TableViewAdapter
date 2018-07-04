# TableViewAdapter
Usage
```swift
let adapter = TableViewAdapter<NibTableViewCell, CustomModel>(withTableView: self.customTableView, items: items) { item, cell in
            cell.nameLabel.text = item.name
        }
```
