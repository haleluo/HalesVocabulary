//
//  VocabularyDataManager.swift
//  Vocabulary
//
//  Created by 罗海林 on 10/25/21.
//

import Foundation

//
class VocabularyDataManager {
    
    private var items:[VocabularyItem] = []

    func fetch(by location:String, with filter: String = "All") {
        //
        if let file = Bundle.main.url(forResource: location, withExtension: "json") {
            do {
                let data = try Data(contentsOf: file)
                let vocabularies = try JSONDecoder().decode([VocabularyItem].self, from: data)
                //
                if filter != "All" {
                    // items = vocabularies.filter({ ($0.cuisines.contains(filter))})
                    items = vocabularies.filter({ ($0.level! > 20 && $0.level! < 30)})
                } else {
                    items = vocabularies
                }
            } catch {
                print("there was an error \(error)")
            }
        }

    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func restaurantItem(at index:Int) -> VocabularyItem {
        return items[index]
    }
    
}

