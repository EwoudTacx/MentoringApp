//
//  MainViewController.swift
//  MentoringApp
//
//  Created by Ewoud Wortelboer on 20/01/2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    let colorData = [UIColor.green, UIColor.red, UIColor.yellow, UIColor.systemPink, UIColor.blue, UIColor.orange, UIColor.darkGray, UIColor.purple]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = colorData[indexPath.item]
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let numberOfColumns: CGFloat = 2
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let itemSpacing = flowLayout.minimumInteritemSpacing * (numberOfColumns - 1)
        let adjustedWidth = collectionViewWidth - itemSpacing
        let width: CGFloat = floor(adjustedWidth / numberOfColumns)
        let height: CGFloat = 100
        return CGSize(width: width, height: height)
    }
}
