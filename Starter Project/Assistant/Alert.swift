//
//  Alert.swift
//  Starter Project
//
//  Created by Ahmed Nasr on 29/03/2023.
//

import UIKit

public struct Alert {
    ///create basic alert
    ///
    private static func createBasicAlert(on vc: UIViewController, with title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
            alert.addAction(okButton)
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    ///create alert for failed to connect with service
    ///
    public static func failedToConnectWithServerAlert(on vc: UIViewController) {
        createBasicAlert(on: vc, with: "", message: "Failed To Connect With Server")
    }
    
    ///create alert for show title and message 
    ///
    public static func defaultAlert(on vc: UIViewController, title: String = "", message: String){
        createBasicAlert(on: vc, with: title, message: message)
    }
}

