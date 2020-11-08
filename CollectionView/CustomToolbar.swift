//
//  CustomToolbar.swift
//  CollectionView
//
//  Created by 柴田優河 on 2020/11/08.
//

import UIKit

class CustomToolbar: UIToolbar {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    func setUp()  {
        self.barTintColor = UIColor.blue
        self.tintColor = UIColor.white
        self.backgroundColor = UIColor.white
    }
}
