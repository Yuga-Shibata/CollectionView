//
//  ViewController.swift
//  CollectionView
//
//  Created by 柴田優河 on 2020/11/05.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0 // 0
            print(statusBarHeight)
           // Toolbarを表示したい場合
           self.navigationController?.setToolbarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // delegate
        collectionView.dataSource = self
        collectionView.delegate = self
        // toolbarをインスタンス化
        let toolbarHeight = view.frame.size.height * 0.1
        let toolbar = CustomToolbar(frame: CGRect(x: 0, y: view.bounds.maxY - toolbarHeight, width: view.frame.size.height, height: toolbarHeight))
        self.view.addSubview(toolbar)
        // collectionViewの配置
        collectionView.backgroundColor = .black
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0 // 0
        print(statusBarHeight)
//        statusbar?.statusBarFrame
        collectionView.frame = CGRect(x: 0, y: statusBarHeight, width: view.frame.size.width, height: view.frame.size.height - statusBarHeight - view.frame.size.height * 0.1)
        // レイアウトを調整
        let layout = UICollectionViewFlowLayout()
        let topMargin = 0.2
        layout.sectionInset = UIEdgeInsets(top: CGFloat(topMargin), left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = CGFloat(1)
        layout.minimumInteritemSpacing = CGFloat(1)
        collectionView.collectionViewLayout = layout
        let horizontalSpace : CGFloat = 20
        let cellSize : CGFloat = self.view.bounds.width / 6.5 - horizontalSpace // view.bounds.widthは画面の幅
        layout.itemSize = CGSize(width: cellSize * 1.3, height: (view.bounds.maxY - statusBarHeight - toolbarHeight) / 6 - (CGFloat(topMargin) * 6)) // cellのサイズ
        print(statusBarHeight)
        view.addSubview(collectionView)
    }

    // セクション数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // 表示するセルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 7
        case 1:
            return 35
        default:
            print("error")
            return 0
        }
    }
    
    // cellに情報を入れていく
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) // 表示するセルを登録する
            cell.backgroundColor = .blue // 表示するセルの色
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) // 表示するセルを登録する
            cell.backgroundColor = .red // 表示するセルの色
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) // 表示するセルを登録する
            cell.backgroundColor = .red // 表示するセルの色
            print(Error.self)
            return cell
        }
        
    }
    
    // セルのサイズ（UICollectionViewForLayoutをprotoclとして準拠しないと、利用できないみたい）
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let horizontalSpace : CGFloat = 20
//            let cellSize : CGFloat = self.view.bounds.width / 3 - horizontalSpace // view.bounds.widthは画面の幅
//            return CGSize(width: cellSize, height: cellSize)
//        }
}
