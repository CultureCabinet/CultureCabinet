import UIKit

class SignUp2ViewController: UIViewController {
    
    let categories = ["영화", "드라마"]
    
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var categoryPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        completeButton.isEnabled = false
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        
        if UserInformation.shared.phoneNumber != nil{
            phoneNumTextField.text = UserInformation.shared.phoneNumber
        }
        dateLabel.text = dateFormatter.string(from: datePicker.date)
    }
    
    // DatePicker
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
        
        let date: Date = self.datePicker.date // sender.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
        
        if dateLabel.text != nil{
            completeButton.isEnabled = true
        }
    }
            
    //취소, 이전, 가입 Button 액션
    @IBAction func touchUpCancel(_ sender: UIButton){
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpPrev(_ sender: UIButton){
        UserInformation.shared.phoneNumber = phoneNumTextField.text!

        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpComp(_ sender: UIButton){
        UserInformation.shared.phoneNumber = phoneNumTextField.text!
        UserInformation.shared.birthDay = dateLabel.text!
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
}
