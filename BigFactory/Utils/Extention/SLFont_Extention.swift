//
//  SLFont.swift
//  BigFactory
//
//  Created by huangqiang on 12/8/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit

extension UIFont{
    
    static func fontName()->String{
        return "Verdana"
    }
    static func boldFontName()->String{
        return "Helvetica-Bold"
    }
}

struct SLFont {
    static func sl_S0() ->UIFont{
        return UIFont(name: UIFont.fontName(), size: 48/2)!
    }
    static func sl_S1() ->UIFont{
        return UIFont(name: UIFont.fontName(), size: 40/2)!
    }
    static func sl_S1_bold() ->UIFont{
        return UIFont(name: UIFont.boldFontName(), size: 40/2)!
    }
    static func sl_S2() ->UIFont{
        return UIFont(name: UIFont.fontName(), size: 36/2)!
    }
    static func sl_S2_1() ->UIFont{
        return UIFont(name: UIFont.fontName(), size: 34/2)!
    }
    static func sl_S3() ->UIFont{
        return UIFont(name: UIFont.fontName(), size: 32/2)!
    }
    static func sl_S4() ->UIFont{
        return UIFont(name: UIFont.fontName(), size: 30/2)!
    }
    static func sl_S5() ->UIFont{
        return UIFont(name: UIFont.fontName(), size: 28/2)!
    }
    static func sl_S6() ->UIFont{
        return UIFont(name: UIFont.fontName(), size: 26/2)!
    }
    static func sl_S7() ->UIFont{
        return UIFont(name: UIFont.fontName(), size: 24/2)!
    }
    static func sl_S8() ->UIFont{
        return UIFont(name: UIFont.fontName(), size: 22/2)!
    }
    static func sl_S9() ->UIFont{
        return UIFont(name: UIFont.fontName(), size: 20/2)!
    }
    static func sl_S10() ->UIFont{
        return UIFont(name: UIFont.fontName(), size: 18/2)!
    }
}