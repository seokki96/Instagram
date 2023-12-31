//
//  Constants.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/18.
//

import Foundation
import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLWERS = Firestore.firestore().collection("follwers")
let COLLECTION_FOLLWING = Firestore.firestore().collection("following")
let COLLECTION_POSTS = Firestore.firestore().collection("posts")
let COLLECTION_NOTIFICATIONS = Firestore.firestore().collection("notifications")
