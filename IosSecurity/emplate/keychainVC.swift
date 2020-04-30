//
//  keychainVC.swift
//  IosSecurity
//
//  Created by Gamal Mostafa on 4/29/20.
//  Copyright © 2020 Gamal Mostafa. All rights reserved.
//

import Foundation
import UIKit
import KeychainAccess

class KeyChainVC : UIViewController {
    
    //MARK:-IBOutlets
    //Set
    @IBOutlet weak var textFieldSetKey: UITextField!
    @IBOutlet weak var textFieldSetValue: UITextField!
    //Get
    @IBOutlet weak var textFieldGetKey: UITextField!
    @IBOutlet weak var lblGetValue: UILabel!
    //Remove
    @IBOutlet weak var textFieldRemoveKey: UITextField!
    @IBOutlet weak var lblRemoveSuccess: UILabel!
    
    
    //MARK:- Keychain Instance
    let keychain = Keychain(service: "iOSAppSecuritySession")
   
    //MARK:- IBActions
    //Set
    @IBAction func set(_ sender: Any) {
        if let key = textFieldSetKey.text, let value = textFieldSetValue.text {
//            keychain[key] = AESEncryptor.encrypt(input: value)
            keychain[key] = value
        }
        
    }
    
    @IBAction func get(_ sender: Any) {
        if let key = textFieldGetKey.text {
//            lblGetValue.text = AESEncryptor.decrypt(input: keychain[key]!)
            lblGetValue.text = keychain[key]
            let creationDate = keychain[attributes: key]?.creationDate
            print(creationDate)
        }
    }
    
    
    @IBAction func remove(_ sender: Any) {
        if let key = textFieldRemoveKey.text {
            do {
                try keychain.remove(key)
                lblRemoveSuccess.text = "Succeded"
            } catch let error {
                print("error: \(error)")
                lblRemoveSuccess.text = "Failed"
            }
        }
        //OR : keychain[key] = nil
    }
    
    
    
}

/*
 Resources :
 * https://github.com/kishikawakatsumi/KeychainAccess
 */
