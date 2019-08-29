# CBuilder

<p align="center">
    <img width="417" alt="Screen Shot 2019-08-28 at 22 25 25" src="https://user-images.githubusercontent.com/32227073/63903129-c1a33000-c9e2-11e9-9031-9e35b0862b14.png">
</p>

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Build Status](https://travis-ci.org/devxoul/Then.svg?branch=master)](https://travis-ci.org/devxoul/Then)



✨ Super sweet syntactic sugar for Constraints in UIKit.

✨ A Swift Autolayout DSL for iOS


## At a Glance

### Before

```swift
//In your controller
let myView = View()

view.addSubview(myView)

    
 myView.translatesAutoresizingMaskIntoConstraints = false
       
 NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: self.view.topAnchor),
            myView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            myView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            myView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
       ])
}
```

### Then:

```swift
view.addSubview(myView)
myView.cBuild(make: .fillSuperview)

```

## Small Advantages

- You can use `closure` to construct the constraint to your view.

    ```swift
    label.cBuilder {
            $0.leading.equal(to: leadingAnchor, offsetBy: 20)
            $0.top.equal(to: topAnchor, offsetBy: 10)
        }
    ```

- Want to set your constraints with your own types? Just make that

    ```swift
    label.cBuild(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor) 
    ```

- A lot times you have set the view in center to super view, so...

    ```swift
   label.cBuild(make: .centerInSuperView)
    ```


## Installation
1. `Clone project`
2. Open your Xcode, select a simulator, click the play button or `cmd + R`
3. Test in your cases, and don't worry to use `TranslateAutoRezingsMas.............................`
 

## License

**CBuilder** is under MIT license. See the [LICENSE](LICENSE) file for more info.
