//
//  Group.swift
//  WeTalk
//
//  Created by GoldRatio on 12/10/14.
//  Copyright (c) 2014 GoldRatio. All rights reserved.
//

import Foundation


class GroupRequest : Serializable
{
    var name: String
    var nick: String {
        get {
            return name
        }
    }
    var userType: UserType = UserType.Room
    var avatar: String
    var members: [String]
    var seqNo: String
    
    required init(json: JSON) {
       
        self.name = json["name"].stringValue
        self.avatar = json["avatar"].stringValue
        let friends = json["users"].arrayValue
        var members = [String]()
        self.seqNo = ""//json["seqNo"].int64Value
        for m in friends {
            if let member = m.string? {
                members.append(member)
            }
        }
        self.members = members
        super.init(json: json)
    }
    
    override init() {
        self.seqNo = ""
        self.name = ""
        self.avatar = ""
        self.members = [String]()
        super.init()
    }
    
    init(name: String, members: [String]) {
        self.name = name
        self.members = members
        self.avatar = ""
        self.seqNo = Session.sharedInstance.messageId
        super.init()
    }
    
    
    
    //    func toJson() -> String {
    //        return "{\"fromUserName\": \"\(fromUserName)\", \"toUserName\": \"\(toUserName)\",\"type\": \(type),\"content\": \"\(content)\",\"clientMsgId\": \(clientMsgId), \"timestamp\": \(createTime)}"
    //    }
    //
    
    // func toDictionary() ->
    //    override func toDictionary() -> NSMutableDictionary {
    //        var modelDictionary = super.toDictionary()
    //        if let attach = self.attach? {
    //            modelDictionary.setValue(attach, forKey: "attach")
    //        }
    //        return modelDictionary
    //    }
    
    func packageData() -> NSString {
        return "5:6:" + self.toJsonString()
    }
    
}

class Group : Serializable, Chatable
{
    var id: String
    var name: String
    var nick: String {
        get {
            return name
        }
    }
    var userType: UserType = UserType.Room
    var avatar: String
    var members: [String]
    var seqNo: Int64
    
    
    required init(json: JSON) {
        if let id = json["id"].int64? {
            self.id = "\(id)@room"
        }
        else {
            self.id = ""
        }
        self.name = json["name"].stringValue
        self.avatar = json["avatar"].stringValue
        let friends = json["users"].arrayValue
        var members = [String]()
        self.seqNo = 0//json["seqNo"].int64Value
        for m in friends {
            if let member = m.string? {
                members.append(member)
            }
        }
        self.members = members
        super.init(json: json)
    }
    
    override init() {
        self.seqNo = 0
        self.id = ""
        self.name = ""
        self.avatar = ""
        self.members = [String]()
        super.init()
    }
    
    init(id: String, name: String, members: [String]) {
        self.id = id
        self.name = name
        self.members = members
        self.avatar = ""
        self.seqNo = 0
        super.init()
    }
    
    //    func toJson() -> String {
    //        return "{\"fromUserName\": \"\(fromUserName)\", \"toUserName\": \"\(toUserName)\",\"type\": \(type),\"content\": \"\(content)\",\"clientMsgId\": \(clientMsgId), \"timestamp\": \(createTime)}"
    //    }
    //
    // func toDictionary() ->
//    override func toDictionary() -> NSMutableDictionary {
//        var modelDictionary = super.toDictionary()
//        if let attach = self.attach? {
//            modelDictionary.setValue(attach, forKey: "attach")
//        }
//        return modelDictionary
//    }
    
    func packageData() -> NSString {
        return "5:6:" + self.toJsonString()
    }
    
}