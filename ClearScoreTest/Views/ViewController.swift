
import UIKit
import Combine



class ViewController: UIViewController, CAAnimationDelegate {
    
    @IBOutlet var viewDetailsButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var creditScoreLabel: UILabel!
    @IBOutlet var maxCreditScoreLabel: UILabel!
    private var animation = CABasicAnimation(keyPath: "strokeEnd")
    private var cancellableSetOne: Set<AnyCancellable> = []
    private var cancellableSetTwo: Set<AnyCancellable> = []
    let viewModel = CreditReportViewModel()
    let shape = CAShapeLayer()
    private var errorHasOccured = ErrorObject()
    var detailedCreditInformation:CreditReportModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
        setUpHomePage()
        animateRing()
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 150, startAngle: -(.pi / 2), endAngle: .pi * 2, clockwise: true)
        let trackShape = CAShapeLayer()
        setUpTrackShape(trackShape: trackShape, circlePath: circlePath)
        view.layer.addSublayer(trackShape)
        setUpShape(shape: shape, circlePath: circlePath)
        setUpShape2(shape: shape, circlePath: circlePath)
        view.layer.addSublayer(shape)
    }
    

    private func setUpShape(shape:CAShapeLayer,circlePath:UIBezierPath){
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
    }
    
    
    private func setUpShape2(shape:CAShapeLayer,circlePath:UIBezierPath){
        shape.path = circlePath.cgPath
        shape.lineWidth = 2
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.blue.cgColor
        shape.strokeEnd = 0
    }
    
    private func setUpTrackShape(trackShape:CAShapeLayer,circlePath:UIBezierPath){
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 15
        trackShape.strokeColor = UIColor.lightGray.cgColor
    }
    
    private func displayCreditDetails(){
        creditScoreLabel.adjustsFontSizeToFitWidth = true
        self.viewModel.$creditReportdetails.sink {[weak self] creditDetails in
            if let creditDetails = creditDetails {
                self?.detailedCreditInformation = creditDetails
                self?.creditScoreLabel.text = "\(creditDetails.creditReportInfo.score)"
                self?.maxCreditScoreLabel.text = "out of \(creditDetails.creditReportInfo.maxScoreValue)"
            }
        }.store(in: &cancellableSetOne)
    }
    
    @IBAction func viewDetails(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeViewController = mainStoryboard.instantiateViewController(withIdentifier: "detailsViewController") as? DetailsViewController {
            homeViewController.creditCardDetails = self.detailedCreditInformation
            navigationController?.pushViewController(homeViewController, animated: true)
        }
    }
    
    private func animateRing(){
        self.animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.delegate = self
        shape.add(animation,forKey:"animation")
    }
    
    private func setUpHomePage(){
        viewDetailsButton.isHidden = true
        creditScoreLabel.isHidden = true
        maxCreditScoreLabel.isHidden = true
        titleLabel.isHidden = false
        self.viewModel.$errorObject.sink {[weak self] error in
            if let error = error {
                if(error.errorFlag == false){
                    self?.displayCreditDetails()
                }
                else {
                    self?.errorHasOccured = error
                    self?.displayErrorMessage()
                }
            }
        }.store(in:&cancellableSetTwo)
    }
    
    private func displayErrorMessage(){
        self.creditScoreLabel.text = self.errorHasOccured.errorDesription
        self.creditScoreLabel.font =  self.creditScoreLabel.font.withSize(16)
        self.creditScoreLabel.textColor = .black
        self.maxCreditScoreLabel.isHidden = true
        self.creditScoreLabel.isHidden = true
        self.titleLabel.isHidden = true
    }
    
     func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.creditScoreLabel.isHidden = false
        if(self.errorHasOccured.errorFlag != true){
            self.maxCreditScoreLabel.isHidden = false
            self.viewDetailsButton.isHidden = false
        }
    }
}


