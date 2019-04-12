//
//  HeroEntity.swift
//  LayoutTraining
//
//  Created by Artyom Belov on 12/04/2019.
//  Copyright © 2019 Artyom Belov. All rights reserved.
//

import UIKit

class HeroEntity {
	var name: String;
	var resourceId: String;
	var backgroundColor: UIColor;
	
	init(name: String, resourceId: String, backgroundColor: UIColor) {
		self.name = name
		self.resourceId = resourceId
		self.backgroundColor = backgroundColor
	}
}
