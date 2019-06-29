//
//  CheckListItem.swift
//  Checklist
//
//  Created by Charles Borabien on 27/6/19.
//  Copyright © 2019 Charles Borabien. All rights reserved.
//

import Foundation

class CheckListItem: NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
