//
//  String+Extension.swift
//  Brollert
//
//  Created by Simelabs on 10/10/24.
//

import Foundation
extension String{
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func retriveDateStringInFormatte(dtFormatterStr:String = "MM/dd/yyyy",currentDtFormatter:String = "yyyy-MM-dd", withLocale:Bool = false ) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = currentDtFormatter
        
        if withLocale {
            switch RKLocalization().getLanguage() {
            case "zh-Hans":
                dateFormatter.locale = Locale(identifier: "zh-Hans")
            case "ja":
                dateFormatter.locale = Locale(identifier: "ja")
            default:
                dateFormatter.locale = Locale(identifier: "en")
                break
            }
        }
        if let dt = dateFormatter.date(from: self){
            dateFormatter.dateFormat = dtFormatterStr
            return dateFormatter.string(from: dt)
        }
        return ""
    }
    
    func trim() -> String
    {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
}
