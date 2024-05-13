//
//  FilterScrollView.swift
//
//
//  Created by mohamed ahmed on 11/05/2024.
//

import UIKit
import Combine
import enum Commons.FilterStatus

class FilterScrollView: UIView {
    
    var filteredArray = FilterStatus.allCases 
    var collectionView: UICollectionView
    var cellId = "Cell"
    private var cancellables = Set<AnyCancellable>()
    
    weak var viewModel: CharacterListViewModel!
    init(frame: CGRect, viewModel: CharacterListViewModel) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(frame: frame)
        
        self.viewModel = viewModel
        setupCollectionView()
        bindViewModel()
    }
    
    func setupCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .clear
    }
    
    private func bindViewModel() {
        viewModel.$characters
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                self.collectionView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FilterScrollView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? FilterCollectionViewCell else { return UICollectionViewCell()}
        cell.configure(
            with: filteredArray[indexPath.item].rawValue,
            selectedFilter: viewModel.filter
        )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.receivedEvents(.selected(filter: filteredArray[indexPath.item].rawValue))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellText = filteredArray[indexPath.item].rawValue
        
        let cellWidth = cellText.size(withAttributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)
        ]).width + 20
        return CGSize(width: cellWidth, height: collectionView.frame.height)
    }
}
