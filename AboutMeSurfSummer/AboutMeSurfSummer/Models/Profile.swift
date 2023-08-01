//
//  Profile.swift
//  AboutMeSurfSummer
//
//  Created by Роман Наумов on 01.08.2023.
//

import UIKit

struct Profile: Hashable {
    let image: UIImage
    let name: String
    let description: String
    let location: String
}

extension Profile {
    static var profile: Profile = .init(image: .avatar, name: "Наумов Роман Александрович", description: "Junior iOS developer", location: "Москва")
}
