//
//  Memo.swift
//  DatabaseRealm
//
//  Created by 春田実利 on 2022/08/22.
//

import Foundation
import RealmSwift

class Memo: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
    
}
