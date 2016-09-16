//
//  postObject.swift
//  ShoeBox_beta_0.0.1
//
//  Created by LawRoceley on 2016-07-02.
//  Copyright © 2016 TSTL. All rights reserved.
//

import Foundation
import SwiftyJSON

class postObject {
    var pictureURL: String!
    var title: String!
    var contentURL: String!
    
    required init(json: JSON) {
        pictureURL = json["thumbnail_standard"].stringValue
        title = json["title"].stringValue
        contentURL = json["url"].stringValue
    }
}
