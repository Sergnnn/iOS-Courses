//
//  WordsVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 08.01.2021.
//

import UIKit
import CoreData


class WordsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  

  
    @IBOutlet weak var wordsCategoryCollection: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        deleteWordsLeft()

        wordsCategoryCollection.delegate = self
        wordsCategoryCollection.dataSource = self
        wordsCategoryCollection.isScrollEnabled = false
        wordsCategoryCollection.backgroundColor = nil
        
        roundCounter = 1
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return words.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WordsCategoryCell", for: indexPath) as? WordsCategoryCell {
            cell.backgroundColor = UIColor.clear
            cell.wordsCategoryCellDelegate = self
            cell.indexPath = indexPath
            cell.updateCell(word: words[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        getWordsForTheGame()
    }
    
    @IBAction func playBtn(_ sender: Any) {
        performSegue(withIdentifier: "MainVC", sender: nil)
    }
}

//MARK: - Extension
extension WordsVC: WordsCategoryCellDelegate {
    func buttonPressed(index: IndexPath) {
        let cell = wordsCategoryCollection.cellForItem(at: index) as! WordsCategoryCell
        if words[index.row].categoryIsEnable == true {
                words[index.row].categoryIsEnable = false
                words[index.row].categoryImageName.removeLast()
                words[index.row].categoryImageName.append("F")
              } else {
                words[index.row].categoryIsEnable = true
                words[index.row].categoryImageName.removeLast()
                words[index.row].categoryImageName.append("T")
              }

       
        let image = UIImage(named: words[index.row].categoryImageName)
        cell.wordsBtn.setImage(image, for: .normal)
        debugPrint("\(words[0].categoryImageName) - \(words[0].categoryIsEnable)")
        debugPrint("\(words[1].categoryImageName) - \(words[1].categoryIsEnable)")
        debugPrint("\(words[2].categoryImageName) - \(words[2].categoryIsEnable)")
    }
}
    



