# ios_cheat_sheet
ios cheat sheet

### Last updated XCode 11.6 Swift 5.1 

#### Timer
```swift
   func timerrfun(){
        timerr.invalidate()
        timerr =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc  func update() {
        let pValue=Float(Float(count)/Float(totalTime));
        if(count > 0) {
            mProgressView.progress=pValue;
            count-=1
        }
        else{
            timerr.invalidate()
            mProgressView.progress=1;
        }
    }
    
```

#### Delay Items
```swift
 DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
   // do your work after 10 seconds.
 }
```


#### PlaySound
```swift
import AVFoundation
class ViewController: UIViewController {
 var player: AVAudioPlayer!
 @IBAction func keyClicked(_ sender: UIButton) {
     playSound(soundName: sender.currentTitle!) 
     //or playSound(soundName: "sound_name") 
 }

 func playSound(soundName:String) {
    let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()
  }
}

 //it will not work if your phone is in silent state..so for that you have to see more code on stackoverflow
 
```
#### Go to Next Screen Modally
Screen 1 -> screen 2

<img src="https://github.com/vishalguptahmh/ios_cheat_sheet/blob/master/Screenshot%202020-08-01%20at%205.26.51%20PM.png" width="350">

```swift
    func goToNextScreenModally() {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    // this will send data to screen2 viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="goToResult"){
            let destination=segue.destination as! screen2
            destination.bmi = String(format: "%.2f", bmi)
        }
    }

```
screen2 -> screen1

```swift
 self.dismiss(animated: true, completion: nil)

```
#### UiTextField or editable textfield

```swift
class ViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var mTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTextField.delegate=self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mTextField.endEditing(true)
        print(textField.text ?? "")
        return true; 
    }
}

```
 
#### location of NSDefaults where your data is saved
```swift
print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)

```

#### sharedPreference like UserDefaults.standard
```swift
  let mSharedPref = UserDefaults.standard;
  var items:[String] = [String]();
  
  // to get items from plist
     if let itemlist=db.array(forKey: itemsNameInSharedPref) as? [String]{
            items = itemlist
     }
     
 // to add items 
 self.db.set(self.items, forKey: self.itemsNameInSharedPref)
                
```
#### temp
```
```

