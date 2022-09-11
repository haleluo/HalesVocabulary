//
//  PreferencesManager.swift
//  Vocabulary
//
//  Created by 罗海林 on 10/31/21.
//

import Foundation

class Preferences: Codable {
    var index: Int
    
    init(index: Int) {
         self.index = index
    }
}

class PreferencesLoader {
    static private var plistURL: URL {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documents.appendingPathComponent("preferences.plist")
    }

    static func load() -> Preferences {
        let decoder = PropertyListDecoder()

        guard let data = try? Data.init(contentsOf: plistURL),
              let preferences = try? decoder.decode(Preferences.self, from: data) else {
                  return Preferences(index: 0)
                  
              }

        return preferences
    }
}

extension PreferencesLoader {
    static func copyPreferencesFromBundle() {
        if let path = Bundle.main.path(forResource: "preferences", ofType: "plist"),
           let data = FileManager.default.contents(atPath: path),
            FileManager.default.fileExists(atPath: plistURL.path) == false {
                FileManager.default.createFile(atPath: plistURL.path, contents: data, attributes: nil)
        }
    }
}

extension PreferencesLoader {
    static func write(preferences: Preferences) {
        let encoder = PropertyListEncoder()

        if let data = try? encoder.encode(preferences) {
            if FileManager.default.fileExists(atPath: plistURL.path) {
                // Update an existing plist
                try? data.write(to: plistURL)
            } else {
                // Create a new plist
                FileManager.default.createFile(atPath: plistURL.path, contents: data, attributes: nil)
            }
        }
    }
}

