//
//  CellModel.swift
//  UITableView
//
//  Created by Arthur Sh on 28.01.2024.
//

import UIKit

enum Professions: String {
    case seo = "SEO"
    case ret = "Retention agent"
    case head = "Head of the desk"
    case teamlead = "Team Leader"
    case sale = "Sale manager"
    case control = "Office control"
}


struct Person: Hashable {
    var portrait: UIImage
    var name: String
    var proffesion: Professions
    var countryImage: UIImage
}

extension Person {
    static var persons: [[Person]] = [
        // Rets
            [Person(portrait: UIImage(named: "image1")!, name: "Maik", proffesion: .ret, countryImage: UIImage(named: "flag1")!),
            Person(portrait: UIImage(named: "image2")!, name: "Garry", proffesion: .ret, countryImage: UIImage(named: "flag2")!)],
        // Ceo
            [Person(portrait: UIImage(named: "image3")!, name: "Mer", proffesion: .seo, countryImage: UIImage(named: "flag3")!)],
        // Head
            [Person(portrait: UIImage(named: "image4")!, name: "Mask", proffesion: .head, countryImage: UIImage(named: "flag4")!),
            Person(portrait: UIImage(named: "image5")!, name: "Kudik", proffesion: .head, countryImage: UIImage(named: "flag5")!)],
        // Teamleads
            [Person(portrait: UIImage(named: "image6")!, name: "Abr", proffesion: .teamlead, countryImage: UIImage(named: "flag6")!),
            Person(portrait: UIImage(named: "image7")!, name: "Nika", proffesion: .teamlead, countryImage: UIImage(named: "flag7")!)],
        // Sales
            [Person(portrait: UIImage(named: "image8")!, name: "Viktor", proffesion: .sale, countryImage: UIImage(named: "flag8")!),
            Person(portrait: UIImage(named: "image9")!, name: "Anton", proffesion: .sale, countryImage: UIImage(named: "flag9")!),
            Person(portrait: UIImage(named: "image10")!, name: "Karim", proffesion: .sale, countryImage: UIImage(named: "flag10")!)]
        ]
}
