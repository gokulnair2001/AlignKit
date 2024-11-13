# Getting Started

Streamlining layout constraints has never been easier thanks to AlignKit. This powerful framework allows you to manage your constraints with a clean and intuitive API, while delivering un-compromised performance that matches Apple's native NSLayoutConstraints.

## Usage

First, import the AlignKit framework into your project:

```swift
import AlignKit
```

### Adding Constraints

Applying constraints with AlignKit is a breeze. Simply select the UIElement you want to constrain, and use the `alk.makeConstraints` method to define your layout:

```swift
button.alk.makeConstraints { frame in
    frame.center.equalToSuperview()
    frame.size.equalTo(200)
}
```

Adding relative constraints have just got easier, use the same `equalTo` modifier:

```swift
button.alk.makeConstraints { frame in
    frame.size.equalTo(90)
    frame.trailing.equalToSuperview()
    frame.bottom.equalTo(buttonOne.anchor.top).inset(16)
}
```

### Updating and Removing Constraints

Updating existing constraints is equally straightforward with `alk.updateConstraints`:

```swift
button.alk.updateConstraints { frame in
    frame.width.height.equalTo(200)
}
```

And if you need to remove constraints, use the `alk.removeConstraints` method:

```swift
button.alk.removeConstraints { frame in
    frame.width.equalTo(200)
}
```

> ⚠️ **Warning**: Updating or Removing a constraint which is not added to element will cause assertionFailure

### Utility Methods

AlignKit also provides handy utility methods to assist with debugging and optimization:

- `debugPrintIf(_:_:)` : Print with a condition
- `debugPrintWith(_:)` : Print with a prefix
- `animateWith(_:)` : Animate constraint changes
- `applyIf(_:)` : Apply constraints conditionally

With AlignKit, you get the power of NSLayoutConstraints combined with a modern, developer-friendly API. 
You can use these modifiers instantly after chaining the `` UIKit/UIView/alk `` DSL.


> 📒 **Remember**: AlignKit have a auto constraint sanitiser which sanitises constraints applied on any view by removing redundant constraints provided.
