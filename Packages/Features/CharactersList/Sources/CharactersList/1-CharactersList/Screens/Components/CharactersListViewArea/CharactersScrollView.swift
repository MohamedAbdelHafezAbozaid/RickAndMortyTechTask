//
//  CharactersScrollView.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import Foundation
import UIKit
import struct Commons.MainCharacter
import Combine

class CharactersScrollView: UIView {
    
    weak var viewModel: CharacterListViewModel! 
    var tableView: UITableView
    let cellId = "Cell"
    var didTap: ((MainCharacter) -> Void)?
    private var cancellables = Set<AnyCancellable>()
    
    init(
        frame: CGRect,
        viewModel: CharacterListViewModel
    ) {
        tableView = UITableView(frame: .zero, style: .plain)
        super.init(frame: frame)
        
        self.viewModel = viewModel
        setupTableView()
        bindViewModel()
    }
    
    func setupTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharactersTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none // Optional: to remove cell separators
    }
    
    private func bindViewModel() {
        viewModel.$characters
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                self.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CharactersScrollView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CharactersTableViewCell else { return UITableViewCell() }
        cell.configure(with: viewModel.characters[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTap?(viewModel.characters[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastRowIndex = tableView.numberOfRows(inSection: indexPath.section) - 1
        if indexPath.row == lastRowIndex {
            viewModel.receivedEvents(.fetchCharacters)
        }
    }
}
