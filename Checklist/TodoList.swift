//
//  TodoList.swift
//  Checklist
//
//  Created by Charles Borabien on 27/6/19.
//  Copyright © 2019 Charles Borabien. All rights reserved.
//

import Foundation

class TodoList {
    var todos: [CheckListItem] = []
    
    init() {
        let item1 = CheckListItem()
        let item2 = CheckListItem()
        let item3 = CheckListItem()
        let item4 = CheckListItem()
        let item5 = CheckListItem()

        item1.text = "Take a jog"
        item2.text = "Watch a movie"
        item3.text = "Code an App"
        item4.text = "Walk the dog"
        item5.text = "Study design patterns"

        todos.append(item1)
        todos.append(item2)
        todos.append(item3)
        todos.append(item4)
        todos.append(item5)
        
    }
    
    func newTodo() -> CheckListItem {
        let item = CheckListItem()
        item.text = randomTitle()
        item.checked = false
        todos.append(item)
        
        return item
    }
    
    private func randomTitle() -> String {
        let titles = ["Take a jog", "Watch a movie", "Code an App", "Walk the dog", "Study design patterns"]
        return titles[Int.random(in: 0...titles.count - 1)]
    }
}
