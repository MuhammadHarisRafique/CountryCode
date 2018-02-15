//
//  ViewController.swift
//  MICountryPicker
//
//  Created by Ibrahim, Mustafa on 1/24/16.
//  Copyright © 2016 Mustafa Ibrahim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let locale = Locale.current
        print(locale)
        let code = (locale as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String?
        print(code)
        
    }
    
    @IBAction func openPickerAction(_ sender: AnyObject) {
        
        let picker = MICountryPicker { (name, code) -> () in
            print(code)
            print(name)
        }
        // delegate
        picker.delegate = self

        // Display calling codes
       picker.showCallingCodes = true

        picker.didSelectCountryWithCallingCodeClosure = {
            
            name,code, callingcode in
            print(code)
            print(name)
            print(callingcode)
            
        }
        navigationController?.pushViewController(picker, animated: true)
    }
}

extension ViewController: MICountryPickerDelegate {
    
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String) {
        picker.navigationController?.popToRootViewController(animated: true)
        label.text = "\(name) \(code)"
        
    }
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
    
        print(dialCode)
        
    }
}

