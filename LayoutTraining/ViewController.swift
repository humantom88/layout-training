//
//  ViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by Artyom Belov on 12/04/2019.
//  Copyright © 2019 Artyom Belov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HeroTableDelegate {

	func handleHeroSelect(hero: HeroEntity) {
		self.heroImageView.image = UIImage(named: hero.resourceId)
		self.heroImageView.backgroundColor = hero.backgroundColor
		self.heroImageView.layer.shadowColor = hero.backgroundColor.cgColor
	}
	
	let topImageContainerBackgroundImageView: UIImageView = {
		let bgImage = UIImageView(image: UIImage(named: "wall"))
		bgImage.contentMode = .scaleAspectFill
		
		return bgImage
	}()
	
	let topImageContainerView: UIView = {
		let containerView = UIView()
		containerView.backgroundColor = .white
		containerView.translatesAutoresizingMaskIntoConstraints = false

		return containerView
	}()
	
	let bottomContainerView: UIView = {
		let containerView = UIView()
		containerView.translatesAutoresizingMaskIntoConstraints = false
		
		return containerView
	}()
	
	let heroImageView: UIImageView = {
		let imageView = UIImageView(image: UIImage(named: "team"))
		imageView.backgroundColor = UIColor(white: 0, alpha: 0.8)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.clipsToBounds = false
		imageView.contentMode = .scaleAspectFit
		
		return imageView
	}()

	let heroesTableViewController: HeroesTableViewController = {
		let heroesTableViewController = HeroesTableViewController()
		heroesTableViewController.tableView.translatesAutoresizingMaskIntoConstraints = false
		return heroesTableViewController
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.heroesTableViewController.heroTableDelegate = self
		
		setupSubviews()
		setupLayout()
	}
	
	private func setupSubviews() {
		view.addSubview(topImageContainerView)
		view.addSubview(bottomContainerView)
		view.addSubview(heroesTableViewController.tableView)
	}
	
	private func setupLayout() {
		topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.70).isActive = true
		topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

		topImageContainerView.addSubview(topImageContainerBackgroundImageView)

		topImageContainerBackgroundImageView.translatesAutoresizingMaskIntoConstraints = false
		topImageContainerBackgroundImageView.topAnchor.constraint(equalTo: topImageContainerView.topAnchor).isActive = true
		topImageContainerBackgroundImageView.bottomAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
		topImageContainerBackgroundImageView.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor).isActive = true
		topImageContainerBackgroundImageView.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor).isActive = true
		topImageContainerView.addSubview(heroImageView)
		
		heroImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
		heroImageView.widthAnchor.constraint(equalTo: heroImageView.heightAnchor, multiplier: 0.75).isActive = true
		heroImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.8).isActive = true
		heroImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
		setupHeroImageViewShadows()
		
		bottomContainerView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
		bottomContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		bottomContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		bottomContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		bottomContainerView.addSubview(heroesTableViewController.tableView)
		
		heroesTableViewController.tableView.topAnchor.constraint(equalTo: bottomContainerView.topAnchor).isActive = true
		heroesTableViewController.tableView.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor).isActive = true
		heroesTableViewController.tableView.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor).isActive = true
		heroesTableViewController.tableView.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor).isActive = true
	}
	
	override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
		super.willTransition(to: newCollection, with: coordinator)
		self.setupHeroImageViewShadows()
	}
	
	private func setupHeroImageViewShadows () {
		let heroIV: UIImageView = self.heroImageView
		heroIV.layoutIfNeeded()
		heroIV.layer.borderWidth = 1
		heroIV.layer.borderColor = UIColor(white: 0, alpha: 0.15).cgColor
		heroIV.layer.borderWidth = 2
		heroIV.layer.cornerRadius = 20
		heroIV.layer.backgroundColor = UIColor.darkGray.cgColor
		heroIV.layer.shadowColor = UIColor.black.cgColor
		heroIV.layer.shadowRadius = 10
		heroIV.layer.shadowOpacity = 1
		
		let shadowHeight: CGFloat = 18
		let shadowPath = CGMutablePath()
		shadowPath.move(to: CGPoint(x: heroIV.layer.shadowRadius, y: heroIV.layer.bounds.height - shadowHeight))
		shadowPath.addLine(to: CGPoint(x: heroIV.layer.shadowRadius, y: heroIV.layer.bounds.height + shadowHeight))
		shadowPath.addLine(to: CGPoint(x: heroIV.layer.bounds.width - heroIV.layer.shadowRadius, y: heroIV.layer.bounds.height + shadowHeight))
		shadowPath.addLine(to: CGPoint(x: heroIV.layer.bounds.width - heroIV.layer.shadowRadius, y: heroIV.layer.bounds.height - shadowHeight))
		
		shadowPath.addQuadCurve(to: CGPoint(x: heroIV.layer.shadowRadius, y: heroIV.layer.bounds.height - shadowHeight),
								control: CGPoint(x: heroIV.layer.bounds.width / 2, y: heroIV.layer.bounds.height + shadowHeight))
		
		heroIV.layer.shadowPath = shadowPath
	}
}

