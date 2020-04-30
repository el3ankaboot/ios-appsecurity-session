//
//  ObfuscatorVC.swift
//  IosSecurity
//
//  Created by Gamal Mostafa on 4/29/20.
//  Copyright © 2020 Gamal Mostafa. All rights reserved.
//

import Foundation
import UIKit


class ObfuscatorVC : UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var textFieldRawText: UITextField!
    
    //MARK:- Obfuscator Instance
    let obfuscator = Obfuscator(withSalt: [AppDelegate.self, NSObject.self, NSString.self])
    
    
    //MARK:- IBActions
    
    @IBAction func obfuscate(_ sender: Any) {
        if let text = textFieldRawText.text {
        let bytes = obfuscator.bytesByObfuscatingString(string: text)
            print(bytes)
            print(obfuscator.reveal(key: bytes))
        }
    }
    
    

}



