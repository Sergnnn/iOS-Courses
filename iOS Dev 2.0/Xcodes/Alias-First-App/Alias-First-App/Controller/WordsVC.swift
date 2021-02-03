//
//  WordsVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 08.01.2021.
//

import UIKit



class WordsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
    
  
    @IBOutlet weak var wordsCategoryCollection: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        wordsCategoryCollection.delegate = self
        wordsCategoryCollection.dataSource = self
        wordsCategoryCollection.isScrollEnabled = false
        wordsCategoryCollection.backgroundColor = nil
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return words.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WordsCategoryCell", for: indexPath) as? WordsCategoryCell {
            cell.backgroundColor = UIColor.clear
            cell.updateCell(word: words[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if words[indexPath.row].categoryIsEnable == true {
            words[indexPath.row].categoryIsEnable = false
        } else {
            words[indexPath.row].categoryIsEnable = true
        }
        
        wordsCategoryCollection.reloadData()
        
        print(words)
    }
}
