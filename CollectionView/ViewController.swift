//
//  ViewController.swift
//  CollectionView
//
//  Created by 柴田優河 on 2020/11/05.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // delegate
        collectionView.dataSource = self
        collectionView.delegate = self
        // レイアウトを調整
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.collectionViewLayout = layout
        let horizontalSpace : CGFloat = 20
        let cellSize : CGFloat = self.view.bounds.width / 6.5 - horizontalSpace // view.bounds.widthは画面の幅
        layout.itemSize = CGSize(width: cellSize, height: cellSize * 3) // cellのサイズ
        collectionView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.size.height)
        view.addSubview(collectionView)
    }

    // セクション数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // 表示するセルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    // cellに情報を入れていく
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) // 表示するセルを登録する
        cell.backgroundColor = .red // 表示するセルの色
        return cell
    }
    
    // セルのサイズ（UICollectionViewForLayoutをprotoclとして準拠しないと、利用できないみたい）
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let horizontalSpace : CGFloat = 20
//            let cellSize : CGFloat = self.view.bounds.width / 3 - horizontalSpace // view.bounds.widthは画面の幅
//            return CGSize(width: cellSize, height: cellSize)
//        }
}
