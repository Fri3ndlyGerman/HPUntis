//
//  Course.swift
//  On Time(table)
//
//  Created by Henrik Panhans on 12.11.17.
//  Copyright © 2017 Henrik Panhans. All rights reserved.
//

import Foundation
import SwiftyJSON

@objc(Course)
class Course: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.longName, forKey: "longName")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(active, forKey: "state")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeInteger(forKey: "id")
        self.longName = aDecoder.decodeObject(forKey: "longName") as! String
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.active = aDecoder.decodeBool(forKey: "state")
    }
    
    var id: Int
    var longName: String
    var name: String
    var active: Bool
    
    init(_ json: JSON) {
        self.id = json["id"].int!
        self.longName = json["longName"].string!
        self.name = json["name"].string!
        self.active = json["active"].bool!
    }
}
