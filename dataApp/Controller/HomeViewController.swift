//
//  ViewController.swift
//  dataApp
//
//  Created by Otávio da Silva on 22/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var viewLoader: UIView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var years: UILabel!
    @IBOutlet weak var popUp: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var holidays: [Holiday] = []
    var mounthList: [String: [Holiday]] = [:]
    var list = [UIAction]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        popUpTap()
        getHolidays(year: "1999")
        
    }
    
    
    func popUpTap() {
        let optionalClosure = {(action: UIAction) in
            self.years.text = action.title
            self.getHolidays(year: action.title)
            
        }
        for year in 1999...2100 {
            if year != 2004 {
                let action = UIAction(title: String(year), state: .off, handler: optionalClosure)
                list.append(action)
            }
        }
        list[0].state = .on
        
        let optionMenu = UIMenu(title: "", options: .displayInline, children: list)
        popUp.menu = optionMenu
        popUp.changesSelectionAsPrimaryAction = true
        popUp.changesSelectionAsPrimaryAction = true
    }
    
    func getHolidays(year: String) {
        let url = URL(string: "https://brasilapi.com.br/api/feriados/v1/\(year)")
        if let url = url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("aplication.json", forHTTPHeaderField: "content-type")
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                
                if let data = data, error == nil {
                    print(String(decoding: data, as: UTF8.self))
                    do {
                        
                        let dateFormater = DateFormatter()
                        dateFormater.dateFormat = "yyyy-MM-dd"
                        
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .formatted(dateFormater)
                        
                        let holiday = try decoder.decode([Holiday].self, from: data)
                        
                        self.holidays = holiday
                        self.mounthList = Dictionary(grouping: self.holidays, by: { holiday in
                            holiday.getMounth()
                            
                        })
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            self.hideLoader()
                        }
                        
                    } catch let error{
                        print(error)
                    }
                }
            }
            showLoader()
            task.resume()
        }
    }
    
    func showLoader() {
        self.viewLoader.isHidden = false
        self.loader.startAnimating()
        self.view.isUserInteractionEnabled = false
    }
    func hideLoader() {
        self.viewLoader.isHidden = true
        self.loader.startAnimating()
        self.view.isUserInteractionEnabled = true
    }
}
