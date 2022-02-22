//
//  ViewController.swift
//  ImageGetter
//
//  Created by Victor Vidal on 21/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var viewModel = ViewControllerViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerNibs()
        loadData()
    }
    
    private func loadData() {
        viewModel.fetchImages(id: 0) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func registerNibs() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: .main),
                           forCellReuseIdentifier: "ImageTableViewCell")
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.generateCell(for: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.numberOfRows() || indexPath.row == 0 { 
            viewModel.fetchImages(id: viewModel.newPagesForImages()) {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
