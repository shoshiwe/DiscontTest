//
//  BanksViewController.swift
//  DidcontTest
//
//  Created by shoshi weinberg on 1/14/20.
//  Copyright © 2020 Weizmann. All rights reserved.
//

import UIKit
import Kingfisher

class BanksViewController: UIViewController {
     let segueShowInformationID = "SegueShowInformation"
    
    var listBanks:[Bank] = [Bank]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

       loadBanks()
    }
    

    func loadBanks() {
        self.listBanks = BanksManager.sortBanksList(list:BanksManager.getBanks())
        
        self.collectionView.reloadData()
        
    }
   
// MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == segueShowInformationID)
        {
            let informationVC:InformationsViewController = segue.destination as! InformationsViewController
            informationVC.symbol = sender as! String
        }
    }
    

}
//MARK: - UICollectionViewDelegate && UICollectionViewDataSource && UICollectionViewDelegateFlowLayout
extension BanksViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    static let bankItemCellIdentifier = "BankItemCollectionViewCell"
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listBanks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:BankItemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BanksViewController.bankItemCellIdentifier, for: indexPath) as! BankItemCollectionViewCell
        let bank = listBanks[indexPath.row]
        cell.lblFullNmae.text = bank.name
        cell.lblStk.text = bank.stk
        cell.lblPriority.text = bank.priority
        cell.imgBank.kf.indicatorType = .activity
        cell.imgBank.kf.setImage(with: URL(string:bank.img))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        self.performSegue(withIdentifier: segueShowInformationID, sender: listBanks[indexPath.row].stk)
    
    }
    
}
