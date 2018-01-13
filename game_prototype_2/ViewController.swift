//
//  ViewController.swift
//  game_prototype_2
//
//  Created by Tenny on 11/01/18.
//  Copyright © 2018 Tenny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var paginator: UIPageControl!
    @IBOutlet weak var gameCollection: UICollectionView!
    var monthComponents: [String] = []
    var bgcolors: [UIColor] = [UIColor.blue, UIColor.black, UIColor.gray, UIColor.white]
    var appliedbgColors: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameCollection.delegate = self
        gameCollection.dataSource = self
        self.gameCollection.register(UINib(nibName: "GameCell", bundle: nil), forCellWithReuseIdentifier: "GameCell")
        paginator.currentPage = 0
        monthComponents = Calendar.current.shortMonthSymbols
        
        for _ in monthComponents {
            appliedbgColors.append(bgcolors[Int(arc4random_uniform(4))])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        paginator.numberOfPages = monthComponents.count
        return monthComponents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        let scene = cell.myskview.scene as! MyScene
        scene.gameLabel.text = monthComponents[indexPath.row]
        scene.backgroundColor = appliedbgColors[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

    }
    
    
    func updatePageIndicator() {

            self.paginator.currentPage = self.gameCollection.indexPathsForVisibleItems[0].row
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updatePageIndicator()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        updatePageIndicator()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.frame.size
    }
}


















