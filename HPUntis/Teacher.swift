//
//  Teacher.swift
//  On Time(table)
//
//  Created by Henrik Panhans on 12.11.17.
//  Copyright © 2017 Henrik Panhans. All rights reserved.
//

import Foundation
import SwiftyJSON

@objc(Teacher)
public class Teacher: NSObject, NSCoding {
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.foreName, forKey: "foreName")
        aCoder.encode(self.lastName, forKey: "longName")
        aCoder.encode(self.name, forKey: "name")
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeInteger(forKey: "id")
        self.foreName = aDecoder.decodeObject(forKey: "foreName") as! String
        self.lastName = aDecoder.decodeObject(forKey: "longName") as! String
        self.name = aDecoder.decodeObject(forKey: "name") as! String
    }
    
    public var id: Int
    public var name: String
    public var foreName: String
    public var lastName: String
    
    public init(_ json: JSON) {
        self.id = json["id"].int!
        self.name = json["name"].string!
        self.foreName = json["foreName"].string!
        self.lastName = json["longName"].string!
    }
}
