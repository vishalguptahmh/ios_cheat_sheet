# ios_cheat_sheet
ios cheat sheet

### Last updated XCode 11.6 Swift 5.1 

#### Timer
```
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
```
 DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
   // do your work after 10 seconds.
 }
```


#### PlaySound
```
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



#### temp
```
```

