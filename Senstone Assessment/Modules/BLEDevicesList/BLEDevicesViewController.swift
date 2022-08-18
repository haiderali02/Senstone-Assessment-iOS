//
//  BLEDevicesViewController.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 16/08/2022.
//

import UIKit

class BLEDevicesViewController: UIViewController {

    // MARK: OUTLETS -
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - PROPERTIES -
    
    var presenter: (ViewToPresenterBLEDeviceListProtocol & InteractorToPresenterBLEDeviceListProtocol)?
    
    // MARK: - VIEW LIFE CYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        // Ask Presenter to perform viewDidload
        
        presenter?.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - PRIVATE METHODS -
    
    private func setupUI() {
        self.title = nil
        titleLabel.text = "SenStone"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
  
}

extension BLEDevicesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter?.setCell(tableView: tableView, forRowAt: indexPath) ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectRowAt(index: indexPath.row)
    }
}

// MARK: - PRESENTER -> VIEW -

extension BLEDevicesViewController: PresenterToViewBLEDeviceListProtocol {
   
    func startBLEServices() {
        print("Scanning Started!...")
    }
    
    func stopBLEServices() {
        print("Scanning Stoped!")
    }
    
    func didReceiveBLEDevices() {
        self.tableView.reloadData()
    }
    
    func didFailToReceiveBLEDevices(withError: String) {
        Utils.showAlert(title: "Alert", description: withError, inViewController: self)
    }
}
 
