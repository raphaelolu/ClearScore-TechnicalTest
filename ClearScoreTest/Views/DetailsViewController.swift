//
//  DetailsViewController.swift
//  ClearScoreTest
//
//  Created by raphael olumofe on 27/03/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var creditCardDetails:CreditReportModel?
    @IBOutlet var scoreBandDescriptionLabel: UILabel!
    @IBOutlet var haveEverDefaultedLabel: UILabel!
    @IBOutlet var percentageUsedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateLabels()
    }
    
    func populateLabels(){
        if let creditCardDetails = creditCardDetails {
            scoreBandDescriptionLabel.text =
            creditCardDetails.creditReportInfo.equifaxScoreBandDescription
            haveEverDefaultedLabel.text = "\(String(describing: creditCardDetails.creditReportInfo.hasEverDefaulted))"
            percentageUsedLabel.text = "\(creditCardDetails.creditReportInfo.percentageCreditUsed)"
        }
    }
}
