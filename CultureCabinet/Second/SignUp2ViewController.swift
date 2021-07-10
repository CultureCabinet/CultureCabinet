import UIKit
import CoreData
import Cosmos

class SignUp2ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    var container:NSPersistentContainer!
    
    //@IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var categoryPicker: UIPickerView!
   // @IBOutlet weak var star: StarRatingView!
    
    @IBOutlet weak var star: CosmosView!
    let categories: [String] = ["영화","드라마","연극","스포츠","전시회"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        categories.count
    }
    // 각 행의 제목 설정
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return categories[row]
       }
       
       // 선택되었을 때 무엇을 할 것인지?
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserInformation.shared.category = row
       }
 
    
    //let categories = ["영화", "드라마"]
   
//        .movie:0,
//        .drama:1,
//        .play:2,
//        .sports:3,
//        .exhibition:4
   
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        completeButton.isEnabled = false
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        
//        if UserInformation.shared.phoneNumber != nil{
//            phoneNumTextField.text = UserInformation.shared.phoneNumber
//        }
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
       // UserInformation.shared.phoneNumber = phoneNumTextField.text!

        self.dismiss(animated: true, completion: nil)
    }
//    func starRating(view: StarRatingView, didSelectRating rating: Double) {
//
//       }
//    func StarRatingValueChanged(view: StarRatingView, value: CGFloat) {
//        UserInformation.shared.score =  Float(value)
//           //sliderView?.value = Float(rating)
//    }
    @IBAction func touchUpComp(_ sender: UIButton){
       // UserInformation.shared.phoneNumber = phoneNumTextField.text!
        UserInformation.shared.date = self.datePicker.date
        UserInformation.shared.score =  Float(star.rating)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
        let entity = NSEntityDescription.entity(forEntityName: "Post", in:self.container.viewContext)
       
        let post_thing = NSManagedObject(entity: entity!, insertInto: self.container.viewContext)
        
        post_thing.setValue(UserInformation.shared.title,forKey: "title")
        post_thing.setValue(UserInformation.shared.date,forKey: "date")
        post_thing.setValue(UserInformation.shared.score,forKey: "score")
        post_thing.setValue(UserInformation.shared.content,forKey: "content")
        post_thing.setValue(UserInformation.shared.image,forKey: "image")
        post_thing.setValue("blank",forKey: "link")
        post_thing.setValue(UserInformation.shared.category,forKey: "category")
        
        do{
            try self.container.viewContext.save()
            fetchContact()
        }catch{
            print(error.localizedDescription)
        }
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    func fetchContact(){
        do{
            let content = try self.container.viewContext.fetch(Post.fetchRequest())as! [Post]
            content.forEach{
                print($0.title)
                print($0.date)
                print($0.score)
                print($0.content)
                print($0.image)
                print($0.link)
                print($0.category)
            }
            
            }catch{
                print(error.localizedDescription)
            }
        }
    
}
