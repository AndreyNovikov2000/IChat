//
//  PeopleViewController.swift
//  IChat
//
//  Created by Andrey Novikov on 8/12/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    
    
    // MARK: - Private properties
    
    private let peopleChat = [MUser(userName: "human1", iconUrlString: "url1", id: 1),
                              MUser(userName: "human2", iconUrlString: "url2", id: 2),
                              MUser(userName: "human3", iconUrlString: "url3", id: 3),
                              MUser(userName: "human4", iconUrlString: "url4", id: 4),
                              MUser(userName: "human5", iconUrlString: "ur54", id: 5),
                              MUser(userName: "human6", iconUrlString: "url6", id: 6),
                              MUser(userName: "human61", iconUrlString: "url1", id: 7),
                              MUser(userName: "human7", iconUrlString: "url2", id: 8),
                              MUser(userName: "human9", iconUrlString: "url3", id: 9),
                              MUser(userName: "human10", iconUrlString: "url4", id: 10),
                              MUser(userName: "human11", iconUrlString: "ur54", id: 11),
                              MUser(userName: "human12", iconUrlString: "url6", id: 12)]
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<LayoutSections, MUser>!
    
    
    // MARK: - Live cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        setupDiffableDataSource()
        reloadData()
        
        
        view.backgroundColor = .orange
    }
    
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.automaticallyShowsCancelButton = false
        searchController.showsSearchResultsController = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    
    private func setupCollectionView() {
        let layout = createCompositionalLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseId)
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: UserCell.reuseId)
    }
}


// MARK: - Layout sections

extension PeopleViewController {
    enum LayoutSections: Int, CaseIterable {
        case users
        
        func headerDescription(usersCount: Int) -> SectionType {
            switch self {
            case .users:
                return SectionType(text: "\(usersCount) people waiting", font: .avenir26, textColor: .black)
            }
        }
    }
}


// MARK: - Create compositional layout

extension PeopleViewController {
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (section, enviroment) -> NSCollectionLayoutSection? in
            guard let section = LayoutSections.init(rawValue: section) else { return nil }
            
            switch section {
            case .users:
                return self.setupCollectionViewUserSection()
            }
        }
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 20
        layout.configuration = configuration
        
        return layout
    }
    
    // MARK: - Layout sectins
    
    private func setupCollectionViewUserSection() -> NSCollectionLayoutSection {
        let spacing: CGFloat = 15
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(spacing)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        let header = setupHeaderSection()
        
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 16, bottom: 20, trailing: 16)
        section.interGroupSpacing = 20
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func setupHeaderSection() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return header
    }
}


// MARK: - Setup diffable data source

extension PeopleViewController {
    private func setupDiffableDataSource() {
        dataSource = UICollectionViewDiffableDataSource<LayoutSections, MUser>.init(collectionView: collectionView, cellProvider: { (collectionView, indexPath, user) -> UICollectionViewCell? in
            guard let layoutSection = LayoutSections(rawValue: indexPath.section) else { return nil }
            
            switch layoutSection {
            case .users:
                return self.configure(collectionView: collectionView, cellType: UserCell.self, value: user, forIndexPath: indexPath)
            }
        })
        
        
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) -> UICollectionReusableView? in
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseId, for: indexPath) as? SectionHeader else { return nil }
            guard let section = LayoutSections(rawValue: indexPath.section) else { return nil }
            let snapshot = self.dataSource.snapshot().itemIdentifiers(inSection: .users)
            header.configure(withSectionType: section.headerDescription(usersCount: snapshot.count))
            return header
        }
    }
    
    private func reloadData(withSearchText searchText: String? = nil) {
        let filtred = peopleChat.filter { $0.containts(withSearchText: searchText) }
        
        var snapshot = NSDiffableDataSourceSnapshot<LayoutSections, MUser>.init()
        let sections = LayoutSections.allCases
        
        snapshot.appendSections(sections)
        snapshot.appendItems(filtred, toSection: .users)
        
        dataSource.apply(snapshot)
    }
}


// MARK: - UISearchBarDelegate

extension PeopleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       reloadData(withSearchText: searchText)
    }
}
