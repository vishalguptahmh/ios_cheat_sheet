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
