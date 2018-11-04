//
//  ViewController.swift
//  TagStyleCollectionViewDemo
//
//  Created by brockk on 11/4/18.
//  Copyright © 2018 Sarthak. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var tagCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    let arrTagTitle = ["Sachin Tendulkar", "Virender Sehwag", "Gautam Gambhir", "Virat Kohli", "Yuvraj Singh", "MS Dhoni", "Suresh Raina", "Harbhajan Singh", "Zaheer Khan", "Munaf Patel", "S Sreesanth"]

    var tagCell: TagCollectionViewCell!
    var arrTag = [Tag]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func initialSetup() {
        setupTagArray()
        setUpCollection()
    }
    
    private func setupTagArray() {
        for name in arrTagTitle {
            var tag = Tag()
            tag.name = name
            self.arrTag.append(tag)
        }
    }
    
    private func setUpCollection() {
        tagCollectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let cellNib = UINib(nibName: "TagCollectionViewCell", bundle: nil)
        tagCollectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
        
        tagCollectionView.backgroundColor = UIColor.clear

        tagCollectionView.dataSource = self
        tagCollectionView.delegate = self
        
        if let cell = (cellNib.instantiate(withOwner: nil, options: nil) as NSArray).firstObject as? TagCollectionViewCell {
            tagCell = cell
        }
    }
    
    private func configureCell(_ cell: TagCollectionViewCell, indexPath: IndexPath) {
        let tag = arrTag[indexPath.row]
        cell.lblTitle.text = tag.name
        cell.lblTitle.textColor = tag.isSelected ? tagTitleSelectionColor : tagTitleDefaultColor
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrTag.count
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? TagCollectionViewCell else {
            return UICollectionViewCell()
        }
        configureCell(cell, indexPath: indexPath)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        self.configureCell(self.tagCell, indexPath: indexPath)
        return self.tagCell.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        arrTag[indexPath.row].isSelected = !arrTag[indexPath.row].isSelected
        self.tagCollectionView.reloadData()
    }
    
}
