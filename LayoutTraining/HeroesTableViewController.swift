//
//  HeroesTableViewController.swift
//  LayoutTraining
//
//  Created by Artyom Belov on 12/04/2019.
//  Copyright © 2019 Artyom Belov. All rights reserved.
//

import UIKit

class HeroesTableViewController: UITableViewController {
	
	public var heroTableDelegate: HeroTableDelegate? = nil
	
	let cellId = "HeroCell"
	
	private let resources: [HeroEntity] = [
		HeroEntity(name: "Sonic", resourceId:"sonic", backgroundColor: UIColor.blue),
		HeroEntity(name: "Knuckles", resourceId:"knuckles", backgroundColor: UIColor.red),
		HeroEntity(name: "Nickolas", resourceId:"nickolas", backgroundColor: UIColor.green),
		HeroEntity(name: "Tails", resourceId:"tails", backgroundColor: UIColor.yellow),
		HeroEntity(name: "Eggman", resourceId:"eggman", backgroundColor: UIColor.black)
	]
	
	private func setupTableView () {
		self.tableView.register(HeroTableViewCell.self, forCellReuseIdentifier: cellId)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupTableView()
	}

	// MARK: - Table view data source

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return resources.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: HeroTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HeroTableViewCell
		
		cell.setInternalFields(hero: resources[indexPath.row])
		
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let heroTD = heroTableDelegate {
			heroTD.handleHeroSelect(hero: resources[indexPath.row])
		}
	}
}
