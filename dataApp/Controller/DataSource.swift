//
//  DataSource.swift
//  dataApp
//
//  Created by Otávio da Silva on 22/11/22.
//

import UIKit

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentCalendar = Calendar.current.monthSymbols[section]
        let mounthArray = self.mounthList[currentCalendar]
        
        return mounthArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentMounth = Calendar.current.monthSymbols[indexPath.section]
        let holidayList = self.mounthList[currentMounth]
        let currentHoliday = holidayList?[indexPath.row]
        
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        cell.configCell(currentHoliday)
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return Calendar.current.monthSymbols.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let currentCalendar = Calendar.current.monthSymbols[section]
        return currentCalendar
    }
}
