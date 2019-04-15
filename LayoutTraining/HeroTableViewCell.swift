//
//  HeroTableViewCell.swift
//  LayoutTraining
//
//  Created by Artyom Belov on 12/04/2019.
//  Copyright © 2019 Artyom Belov. All rights reserved.
//

import UIKit

class HeroTableViewCell: UITableViewCell {
	
	public var resourceId: String = "";
	public var bgColor: UIColor?;

	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	public func setInternalFields(hero: HeroEntity) {
		if let label = self.textLabel {
			label.textAlignment = .center
			label.text = hero.name
		}
		
		bgColor = hero.backgroundColor
		resourceId = hero.resourceId
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}

}
