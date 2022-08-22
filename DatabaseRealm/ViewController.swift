//
//  ViewController.swift
//  DatabaseRealm
//
//  Created by 春田実利 on 2022/08/22.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate {
    
    let realm = try! Realm()
    
    @IBOutlet var titleTextFiled: UITextField!
    @IBOutlet var contentTextFiled: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextFiled.delegate = self
        contentTextFiled.delegate = self
        
        let memo: Memo? = read()
        
        titleTextFiled.text = memo?.title
        contentTextFiled.text = memo?.content
        // Do any additional setup after loading the view.
    }
    
    func read() -> Memo? {
        return realm.objects(Memo.self).first
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        
        }
    
    @IBAction func save() {
        let title: String = titleTextFiled.text!
        let content: String = contentTextFiled.text!
        
        let memo: Memo? = read()
        
        if memo != nil {
            try! realm.write {
                memo!.title = title
                memo!.content = content
            }
        } else {
            let newMemo = Memo()
            newMemo.title = title
            newMemo.content = content
            
            try! realm.write {
                realm.add(newMemo)
            }
        }
        
        let alert: UIAlertController = UIAlertController(title: "成功", message: "保存しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }


}

