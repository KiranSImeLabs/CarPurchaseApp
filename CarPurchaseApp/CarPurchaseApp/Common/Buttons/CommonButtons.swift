//
//  CommonButtons.swift
//  Brollert
//
//  Created by Simelabs on 12/09/24.
//

import UIKit

class MainButton:UIButton{
    override init(frame: CGRect){
        super.init(frame: frame)
        addProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addProperties()
        //fatalError("init(coder:) has not been implemented")
    }
    func addProperties(){
//        self.setTitleColor(AppColorConstants.getWhiteColor, for: .normal)
//        self.titleLabel?.font = CustomFont().getFontOfsize(fontName: .rethinkSemibold, size: 16)
//        self.backgroundColor = AppColorConstants.getButtonBackgroundColor
//        self.layer.cornerRadius = 28
    }
    
}
