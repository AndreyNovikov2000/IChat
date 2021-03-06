//
//  ListViewController.swift
//  IChat
//
//  Created by Andrey Novikov on 8/12/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit


class ListViewController: UIViewController {
    
    // MARK: - Private properties
        
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<LayoutSections, MChat>!
    private let layoutSections = LayoutSections.allCases
    private let activeChats = [MChat(friendName: "human1", friendImage: "ewr", lastMessage: "whats going on?", id: 14),
                               MChat(friendName: "human234", friendImage: "ewr", lastMessage: "whats going on?", id: 1324),
                               MChat(friendName: "hum2341", friendImage: "ewr", lastMessage: "whats going on?", id: 1123),
                               MChat(friendName: "human", friendImage: "ewr", lastMessage: "whats going on?", id: 21),
                               MChat(friendName: "human3", friendImage: "ewr", lastMessage: "whats going on?", id: 3125),
                               MChat(friendName: "human2", friendImage: "ewr", lastMessage: "whats going on?", id: 454)]
    
    private let waitingChats = [MChat(friendName: "human1", friendImage: "ewr", lastMessage: "whats going on?", id: 11),
                                MChat(friendName: "human234", friendImage: "ewr", lastMessage: "whats going on?", id: 41),
                                MChat(friendName: "hum2341", friendImage: "ewr", lastMessage: "whats going on?", id: 71),
                                MChat(friendName: "human", friendImage: "ewr", lastMessage: "whats going on?", id: 232),
                                MChat(friendName: "human3", friendImage: "ewr", lastMessage: "whats going on?", id: 63),
                                MChat(friendName: "human2", friendImage: "ewr", lastMessage: "whats going on?", id: 94)]
    
    
    // MARK: - Live cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupCollectionView()
        setupDiffableDataSource()
        registedDiffableDataSourceShapshot()
        setupNavigationBar()
    }
    
    // MARK: - Private methods
    
    // MARK: - Setup
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.backgroundColor = .white
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseId)
        collectionView.register(ActiveChat.self, forCellWithReuseIdentifier: ActiveChat.reuseId)
        collectionView.register(WaitingChat.self, forCellWithReuseIdentifier: WaitingChat.reuseId)
    }
    
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
}


// MARK: - Layout sections

extension ListViewController {
    enum LayoutSections: Int, CaseIterable {
        case waitingCahts
        case activeChats
        
        func headerDescription() -> SectionType {
            let type: SectionType
            
            switch self {
            case .waitingCahts:
                type = SectionType(text: "Waiting chats", font: .avenir20, textColor: .black)
                return type
            case .activeChats:
                 type = SectionType(text: "Active chats", font: .avenir20, textColor: .black)
                return type
            }
        }
    }
}


// MARK: - Compositional layout

extension ListViewController {
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            let layoutSection = self.layoutSections[sectionIndex]
            
            switch layoutSection {
            case .activeChats:
                return self.configureActiveChatsLayoutSection()
            case .waitingCahts:
                return self.configureWaitingChatsLayoutSection()
            }
        }
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 20
        layout.configuration = configuration
        
        return layout
    }
    
    
    // MARK: - Layout
    
    private func configureActiveChatsLayoutSection() -> NSCollectionLayoutSection {
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 8, trailing: 0)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 20, leading: 16, bottom: 10, trailing: 16)
        
        return section
    }
    
    private func configureWaitingChatsLayoutSection() -> NSCollectionLayoutSection {
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 3, bottom: 0, trailing: 3)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension:  .absolute(75), heightDimension: .absolute(75))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        let sectionHeader = createSectionHeader()
        
        section.boundarySupplementaryItems = [sectionHeader]
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 20, leading: 10, bottom: 10, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 16
        
        return section
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return header
    }
}


 // MARK: - Setup diffable data source

extension ListViewController {
    private func setupDiffableDataSource() {
        dataSource = UICollectionViewDiffableDataSource<LayoutSections, MChat>.init(collectionView: collectionView, cellProvider: { (collectionView, indexPath, mchat) -> UICollectionViewCell? in
            guard let layoutSection = LayoutSections(rawValue: indexPath.section) else { return nil }
            
            switch layoutSection {
            case .waitingCahts:
                return self.configure(collectionView: collectionView, cellType: WaitingChat.self, value: mchat, forIndexPath: indexPath)
            case .activeChats:
                return self.configure(collectionView: collectionView, cellType: ActiveChat.self, value: mchat, forIndexPath: indexPath)
            }
        })
        
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) -> UICollectionReusableView? in
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseId, for: indexPath) as? SectionHeader else { return nil }
            guard let section = LayoutSections(rawValue: indexPath.section) else { return nil }
            header.configure(withSectionType: section.headerDescription())
            return header
        }
    }
    
    private func registedDiffableDataSourceShapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<LayoutSections, MChat>.init()
        let allLayoutSections = LayoutSections.allCases
        
        snapshot.appendSections(allLayoutSections)
        snapshot.appendItems(activeChats, toSection: .activeChats)
        snapshot.appendItems(waitingChats, toSection: .waitingCahts)
        
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
}


// MARK: - UISearch bar delegate

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
