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
		self.heroCardView?.updateHeroCard(entity: hero)
	}
	
	var heroCardView: HeroCardView?
	
	let bottomContainerView: UIView = {
		let containerView = UIView()
		containerView.translatesAutoresizingMaskIntoConstraints = false
		
		return containerView
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
		self.heroCardView = HeroCardView()
		if let heroCard = self.heroCardView {
			view.addSubview(heroCard)
		}
		view.addSubview(bottomContainerView)
		view.addSubview(heroesTableViewController.tableView)
	}
	
	private func setupLayout() {
		if let heroCard = heroCardView {
			heroCard.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
			heroCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.70).isActive = true
			heroCard.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
			heroCard.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
			
			bottomContainerView.topAnchor.constraint(equalTo: heroCard.bottomAnchor).isActive = true
		}
		bottomContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		bottomContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		bottomContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		bottomContainerView.addSubview(heroesTableViewController.tableView)
		
		heroesTableViewController.tableView.topAnchor.constraint(equalTo: bottomContainerView.topAnchor).isActive = true
		heroesTableViewController.tableView.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor).isActive = true
		heroesTableViewController.tableView.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor).isActive = true
		heroesTableViewController.tableView.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor).isActive = true
	}
}

