import UIKit
import CoreData
import Cosmos

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,
                            UITextViewDelegate,UIPickerViewDelegate, UIPickerViewDataSource{
    var container:NSPersistentContainer!
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var star: CosmosView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var introTextView: UITextView!
//    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var imgData:Data!
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
   
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        return picker
    }()
    
    
    @IBAction func tapSelectImageView(_ sender: Any){
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
//
//        if idTextField.text != nil && introTextView != nil{
//                nextButton.isEnabled = true
//
//        }
//        else {
//            nextButton.isEnabled = false
//        }
    }
    
    
//    @IBAction func touchUpNext(_ sender: UIButton){
//        UserInformation.shared.title = idTextField.text!
//        UserInformation.shared.content = introTextView.text!
//        UserInformation.shared.image = imgData
//    }
//
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageView.image = originalImage
            //var data : Data = UIImage.pngData(originalImage)
            //UserInformation.shared.image = originalImage
            imgData = originalImage.jpegData(compressionQuality: 0.75)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    func placeholderSetting() {
        introTextView.delegate = self // txtvReview가 유저가 선언한 outlet
        introTextView.text = "제가 바로 PlaceHolder입니다."
        introTextView.textColor = UIColor.lightGray
        
    }
    
    
    // TextView Place Holder
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
    }
    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "제가 바로 PlaceHolder입니다."
            textView.textColor = UIColor.lightGray
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        introTextView.delegate = self // txtvReview가 유저가 선언한 outlet
        introTextView.text = "느낀점을 작성하세요."
        introTextView.textColor = UIColor.lightGray
        completeButton.isEnabled = false
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        
        dateLabel.text = dateFormatter.string(from: datePicker.date)
//        nextButton.isEnabled = false
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        
        let tapGestureImageView: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapSelectImageView(_:)))
        
        self.imageView.addGestureRecognizer(tapGestureImageView)
        self.view.addGestureRecognizer(tapGesture)
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
    
    @IBAction func touchUpComp(_ sender: UIButton){
       // UserInformation.shared.phoneNumber = phoneNumTextField.text!
        UserInformation.shared.title = idTextField.text!
        UserInformation.shared.content = introTextView.text!
        UserInformation.shared.image = imgData
        UserInformation.shared.date = dateLabel.text!
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
//        guard let vc = UIStoryboard(name: "MainPage", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? MainPageViewController else {
//            return
//        }
//
//        vc.modalPresentationStyle = .fullScreen
//        vc.modalTransitionStyle = .crossDissolve
//        present(vc, animated: true, completion: nil)
        categoryPicker = nil
        completeButton = nil
        datePicker
        @IBOutlet weak var dateLabel: UILabel!
        @IBOutlet weak var star: CosmosView!
        @IBOutlet weak var idTextField: UITextField!
        @IBOutlet weak var introTextView: UITextView!
    //    @IBOutlet weak var nextButton: UIButton!
        @IBOutlet weak var imageView: UIImageView!
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
