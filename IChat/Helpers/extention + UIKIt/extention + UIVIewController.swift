//
//  extention + UIVIewController.swift
//  IChat
//
//  Created by Andrey Novikov on 8/16/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

extension UIViewController {
    func configure<T: ConfiguringCell, H: Hashable>(collectionView: UICollectionView, cellType: T.Type, value: H, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else { fatalError("Unable to dequeue cell - \(cellType)") }
        cell.configure(with: value)
        return cell
    }
}
