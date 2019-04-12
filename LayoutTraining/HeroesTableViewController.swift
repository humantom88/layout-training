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
	
	/*
	// Override to support conditional editing of the table view.
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		// Return false if you do not want the specified item to be editable.
		return true
	}
	*/

	/*
	// Override to support editing the table view.
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			// Delete the row from the data source
			tableView.deleteRows(at: [indexPath], with: .fade)
		} else if editingStyle == .insert {
			// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		}
	}
	*/

	/*
	// Override to support rearranging the table view.
	override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

	}
	*/

	/*
	// Override to support conditional rearranging of the table view.
	override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		// Return false if you do not want the item to be re-orderable.
		return true
	}
	*/

	/*
	// MARK: - Navigation

	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destination.
		// Pass the selected object to the new view controller.
	}
	*/

}
