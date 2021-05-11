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
#### Different type of data storage 

| Method  | Use |
| ------------- | ------------- |
| UserDefaults  | small bits of data e.g. nickname, music on/off  |
| Codable  | Flash freeze custom objects  |
| Keychain  | small bits of data securely like username and passwords  |
| SQLite  | Perisist large amount of data and query it  |
| Code Data | Object oriented datbase  |
| Realm  | A faster and easier Object oriented datbase solution |

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

#### Codeable
```swift
class TodoItem  : Codable{
    var title : String = ""
    var done : Bool = false;
    
    init(_ title :String , _ done : Bool) {
        self.title=title
        self.done=done
    }
}



class ViewController: UITableViewController {
    var items:[TodoItem] = [TodoItem]();
    let datafilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    //MARK: - Add data to database
    func addValueTodb(){
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(self.items)
            try data.write(to: datafilePath!)
        }
        catch{
            print("error occurs : \(error)")
        }
    }
    
    //MARK: - get data from database
    func loadItemsFromdb() {
        if let data =  try? Data(contentsOf: datafilePath!){
            do {
                let decoder = PropertyListDecoder()
                items = try decoder.decode([TodoItem].self, from: data)
            } catch  {
                print("\(error)")
            }
        }
    }
}


```
#### DataModel
>Create a DataModel file by clicking `New File` select `Data model` then `create`

>Copy paste below code in `AppDeligate.swift` file 

>Change the `modelName` variable

```swift

 func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    let modelName = "DataModel"
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
```
>Now Add entities and attributes your `datamodel file`

#### Pretty log
```js
<script src="https://gist.github.com/vishalguptahmh/b998c59216e1c8189dd58edc8246cc77.js"></script>
```
source : https://gist.github.com/vishalguptahmh/b998c59216e1c8189dd58edc8246cc77



#### Launch screen doesnot reflect back after changing images
ios cache storeyboard images so it will not reflect but we can delete it

swift
```swift
do {
   try FileManager.default.removeItem(atPath: NSHomeDirectory()+"/Library/SplashBoard")
} catch {
   print("Failed to delete launch screen cache: \(error)")
}

```
objc

```objc
@try {
   NSLog(@"%@",[[NSFileManager defaultManager] subpathsAtPath:NSHomeDirectory()]);
   NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/SplashBoard"];
   NSLog(@"delete launch screen cache %@ , path : %@",NSHomeDirectory(),path);      
   [[NSFileManager defaultManager] removeItemAtPath:(path) error:(NULL)];
}
@catch (NSException *exception) {
    NSLog(@"Failed to delete launch screen cache: %@",exception);
}
```

#### temp
```swift
```



