//
//  Fonts+Extension.swift
//  pager
//
//  Created by Aleksandr Sidorov on 25.05.2021.
//

import SwiftUI

private enum FontName {
    static var medium = "SFUIText-Medium"
    static var regular = "SourceSansPro-Regular"
    static var semibold = "SourceSansPro-SemiBold"
    static var boldSans = "SourceSansPro-Bold"
    static var bold = "SFUIDisplay-Bold"
}

extension Font {
    
    static var headline20: Font {
        return Font.custom(FontName.semibold, size: 20)
    }
    
    static var text: Font {
        return Font.custom(FontName.regular, size: 16)
    }
}

extension UIFont {
    
    static var smallText: UIFont {
        return UIFont(name: FontName.regular, size: 14)!
    }
}
