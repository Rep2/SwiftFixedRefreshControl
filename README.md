# SwiftFixedRefreshControl

Fixes stuck UIRefreshControl animation.

## Usage

Inherit from ```RefreshTableViewController```. Start and stop refresh control animation using ```beginRefreshing()``` and ```endRefreshing()``` respectively.

Override ```refreshControlValueChanged()``` to capture refresh control value change event.

```Swift
class FixedTableViewController: RefreshTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        beginRefreshing()

        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.endRefreshing()
        }
    }
    
    override func refreshControlValueChanged() {
        super.refreshControlValueChanged()
        
        performRequest()
    }
}
```

## Installation

### Carthage

```
github "Rep2/SwiftFixedRefreshControl" ~> 0.1
```

## Problem

Refresh control stops animating on screen transition or foreground exit/enter even though the value of ```isRefreshing``` is ```true```.

![Refresh control fix](https://thumbs.gfycat.com/JadedSnarlingAmericanalligator-size_restricted.gif)

To fix this recreate refresh control on ```viewWillAppear``` when needed.

Check out the demo for more info.

