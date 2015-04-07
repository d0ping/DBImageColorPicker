# DBImageColorPicker

It's very useful component for determine different colors from your image. Component picker produces various types of main colors and additional primary and secondary colors.

![Screenshot of Example](https://github.com/d0ping/DBImageColorPicker/blob/master/Example/Resources/Screenshot.jpg)

## Adding to your project

### Cocoapods

To add DBImageColorPicker via [CocoaPods](http://cocoapods.org/) into your project:

1. Add a pod entry for DBImageColorPicker to your Podfile `pod 'DBImageColorPicker', '~> 1.0.0'`
2. Install the pod by running `pod install`

### Source Files

To add DBImageColorPicker manually into your project: 

1. Download the latest code, using `git clone`
2. Open your project in Xcode, then drag and drop the `DBImageColorPicker.h` and `.m` class and `UIImage+Color.h` and `.m` category into your project (Make sure to select Copy items when asked if you extracted the code archive outside of your project)

## Usage

To use it, just import the `DBImageColorPicker.h` header file into any class, and then initialize DBImageCollorPicker instance and specify UIImage object to image property. Use the relevant properties of your DBImageColorPicker instance for getting colors.

### Setting

 Different types of background color needed because it is not always the average color (default) looks so good. To influence the definition of the background color, you must specify the DBImageColorPickerBackgroundType when creating an DBImageColorPicker instance. Type can equal one of following values:
- `DBImageColorPickerBackgroundTypeDefault` - allows to get average color;
- `DBImageColorPickerBackgroundTypeHeaderSide` - allows to get the average color of the upper right part of the image (10% of the image);
- `DBImageColorPickerBackgroundTypeFooterSide` - allows to get the average color of the lower right part of the image (10% of the image).

For example, how it can be implemented:

```objc
    UIImage *image = [UIImage imageNamed:@"imageName"];
    DBImageColorPicker *colorPicker = [[DBImageColorPicker alloc] initFromImage:image withBackgroundType:DBImageColorPickerBackgroundTypeFooterSide];

    self.view.backgroundColor = _colorPicker.backgroundColor;
    self.titleLabel.textColor = _colorPicker.primaryTextColor;
    self.subtitleLabel.textColor = _colorPicker.secondaryTextColor;
```

## Contact

Denis Bogatyrev (maintainer)

- https://github.com/d0ping
- denis.bogatyrev@gmail.com

##License

DBImageColorPicker - Copyright (c) 2015 Denis Bogatyrev

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.