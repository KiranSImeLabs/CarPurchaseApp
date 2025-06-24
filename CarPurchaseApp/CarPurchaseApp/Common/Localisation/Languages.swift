//
//  Languages.swift
//  Brollert
//
//   Created by Simelabs on 01/10/24.
//

import UIKit

class Languages: NSObject {
    
    /// Language code to show in application to choese
    fileprivate(set) static var languages: [Language] = {
        
        var languages: [Language] = []
        languages.append(Language(languageCode: "zh-Hans", language: "繁體中文"))
        languages.append(Language(languageCode: "en", language: "English"))
        languages.append(Language(languageCode: "ja", language: "日本語"))
        return languages
    }()

    // Find a Language Available for Application or not
    //
    // - Parameter code: Language code, exe. en
    // - Returns: true/false
    class func isLanguageAvailable(_ code: String) -> Bool {
        for language in languages {
            if  code == language.languageCode {
                return true
            }
        }
        return false
    }

    // Find a Language based on it's Language code
    //
    // - Parameter code: Language code, exe. en
    // - Returns: Language
    class func languageFromLanguageCode(_ code: String) -> Language {
        for language in languages {
            if  code == language.languageCode {
                return language
            }
        }
        return Language.emptyLanguage
    }
    // Find a Language based on it's Language Name
    //
    // - Parameter languageName: languageName, exe. english
    // - Returns: Language
    class func languageFromLanguageName(_ languageName: String) -> Language {
        for language in languages {
            if languageName == language.language {
                return language
            }
        }
        return Language.emptyLanguage
    }
    
    class func getLanguageArray() -> [String]{
        var langArray = [String]()
        
        for language in languages {
            langArray.append(language.language)
        }
        return langArray
        
    }
    
    
}
