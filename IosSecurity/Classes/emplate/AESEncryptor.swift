//
//  AESEncryptor.swift
//  IosSecurity
//
//  Created by Gamal Mostafa on 4/30/20.
//  Copyright © 2020 Gamal Mostafa. All rights reserved.
//

import Foundation
import CryptoSwift

class AESEncryptor{
    
    private static let key = "orangeencryption";//16 char secret key
    
    public static func encrypt(input:String)->String?{
        do{
            let encrypted: Array<UInt8> = try AES(key: key, iv: key, padding: .pkcs5).encrypt(Array(input.utf8))
            
            return encrypted.toBase64()
        }catch{
            
        }
        return nil
    }
    
    public static func decrypt(input:String)->String?{
        do{
            let d=Data(base64Encoded: input)
            let decrypted = try AES(key: key, iv: key, padding: .pkcs5).decrypt(
                d!.bytes)
            return String(data: Data(decrypted), encoding: .utf8)
        }catch{
            
        }
        return nil
    }
}
