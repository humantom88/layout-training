//
//  HeroCardView.swift
//  LayoutTraining
//
//  Created by Artyom Belov on 15/04/2019.
//  Copyright © 2019 Artyom Belov. All rights reserved.
//

import UIKit

class HeroCardView: UIView, HeroCardProtocol {
	
	let heroImageView: UIImageView = {
		let imageView = UIImageView(image: UIImage(named: "team"))
		imageView.backgroundColor = UIColor(white: 0, alpha: 0.8)
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		
		// Setup Layer
		imageView.layer.backgroundColor = UIColor.darkGray.cgColor
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = UIColor(white: 0, alpha: 0.15).cgColor
		imageView.layer.borderWidth = 2
		imageView.layer.cornerRadius = 20
		
		// Setup Layer Shadows
		imageView.layer.shadowColor = UIColor.black.cgColor
		imageView.layer.shadowRadius = 10
		imageView.layer.shadowOpacity = 0.8
		
		return imageView
	}()

	let heroContainerBackgroundImageView: UIImageView = {
		let bgImage = UIImageView(image: UIImage(named: "wall"))
		bgImage.translatesAutoresizingMaskIntoConstraints = false
		bgImage.contentMode = .scaleAspectFill
		
		return bgImage
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .white
		translatesAutoresizingMaskIntoConstraints = false
		
		setupSubviews()
		setupConstraints()
		
		updateHeroImageShadows()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	// MARK: - Protocol Conformance
	// MARK: - HeroCardProtocol

	func updateHeroCard(entity: HeroEntity) {
		heroImageView.image = UIImage(named: entity.resourceId)
		heroImageView.backgroundColor = entity.backgroundColor
		heroImageView.layer.shadowColor = entity.backgroundColor.cgColor
	}
	
	func updateHeroImageShadows() {
		// heroImageView.layoutIfNeeded()
		heroImageView.layer.shadowPath = nil
		heroImageView.layer.shadowPath = createShadowPath(bounds: heroImageView.frame)
	}
	
	// MARK: - Private Methods

	private func createShadowPath (bounds: CGRect) -> CGMutablePath {
		let shadowHeight: CGFloat = bounds.height * 0.05
		let shadowPath = CGMutablePath()
		shadowPath.move(to: CGPoint(x: heroImageView.layer.shadowRadius, y: bounds.height - shadowHeight))
		shadowPath.addLine(to: CGPoint(x: heroImageView.layer.shadowRadius, y: bounds.height + shadowHeight))
		shadowPath.addLine(to: CGPoint(x: bounds.width - heroImageView.layer.shadowRadius, y: bounds.height + shadowHeight))
		shadowPath.addLine(to: CGPoint(x: bounds.width - heroImageView.layer.shadowRadius, y: bounds.height - shadowHeight))
		
		shadowPath.addQuadCurve(to: CGPoint(x: heroImageView.layer.shadowRadius, y: bounds.height - shadowHeight),
								control: CGPoint(x: bounds.width / 2, y: bounds.height + shadowHeight))
		
		return shadowPath
	}
	
	private func setupSubviews () {
		addSubview(heroContainerBackgroundImageView)
		addSubview(heroImageView)
	}
	
	private func setupConstraints () {
		heroContainerBackgroundImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		heroContainerBackgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
		heroContainerBackgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
		heroContainerBackgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
	
		heroImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
		heroImageView.widthAnchor.constraint(equalTo: heroImageView.heightAnchor, multiplier: 0.75).isActive = true
		heroImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
		heroImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		self.updateHeroImageShadows()
	}
}
