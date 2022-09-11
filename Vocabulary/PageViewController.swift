//
//  PageViewController.swift
//  Vocabulary
//
//  Created by 罗海林 on 10/9/21.
//

import UIKit

class PageViewController: UIPageViewController {
    
    private var preferences = PreferencesLoader.load()

    let manager = VocabularyDataManager()
    
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
//        view.translatesAutoresizingMaskIntoConstraints = false
        
        manager.fetch(by: "vocabularies", with: "b")
        
        preferences = PreferencesLoader.load()
        currentIndex = preferences.index
        
        guard let startingViewController = detailViewControllerAt(index: currentIndex) else {
            return
        }
        setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
    }
    
    
    func detailViewControllerAt(index: Int) -> WordViewController? {
        
        if manager.numberOfItems() == 0 || index >= manager.numberOfItems() || index < 0 {
            return nil
        }
        
//        let wordViewController = WordViewController()
        guard let wordViewController = storyboard?.instantiateViewController(identifier: String(describing: WordViewController.self)) as? WordViewController else {
            return nil
        }
        
        wordViewController.index = index
        wordViewController.total = manager.numberOfItems()
        wordViewController.wordText = manager.restaurantItem(at: index).name
        wordViewController.soundmakText = manager.restaurantItem(at: index).soundMark
        wordViewController.partText = manager.restaurantItem(at: index).part
        wordViewController.tagText = manager.restaurantItem(at: index).posGram
        wordViewController.titleText = manager.restaurantItem(at: index).title
        wordViewController.defText = manager.restaurantItem(at: index).definition
        wordViewController.dExamples = manager.restaurantItem(at: index).dExamples
        wordViewController.lExamples = manager.restaurantItem(at: index).lExamples
        
        return wordViewController
    }
    
}

// MARK: Private Extension
private extension PageViewController {
    
    @IBAction func unwindLocationCancel(segue:UIStoryboardSegue){}
    
    @IBAction func unwindLocationDone(segue:UIStoryboardSegue){
        if let viewController = segue.source as? JumpViewController {
            if viewController.index <= 0 {
                return
            }
            currentIndex = viewController.index - 1
            guard let startingViewController = detailViewControllerAt(index: currentIndex) else {
                return
            }
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
            
            preferences.index = currentIndex
            PreferencesLoader.write(preferences: self.preferences)
        }
    }
    
}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return manager.numberOfItems()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let wordViewController = viewController as? WordViewController
        
        guard var currentIdx = wordViewController?.index else {
            return nil
        }
        if currentIdx == 0 {
            return nil
        }
        
        currentIdx -= 1
        currentIndex = currentIdx
        
        preferences.index = currentIdx
        PreferencesLoader.write(preferences: self.preferences)
        
        return detailViewControllerAt(index: currentIdx)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let wordViewController = viewController as? WordViewController
        // print("2 index", wordViewController?.index)
        
        guard var currentIdx = wordViewController?.index else {
            return nil
        }
        if currentIdx == manager.numberOfItems() - 1 {
            return nil
        }
        
        currentIdx += 1
        currentIndex = currentIdx
        
        preferences.index = currentIdx
        PreferencesLoader.write(preferences: self.preferences)
        
        return detailViewControllerAt(index: currentIdx)
    }
    
}
