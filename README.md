KTTextView
==========

KTTextView derives from UITextView enhancing it with new features. The only new feature at the moment is the **placeholderText** property. The **placeholderText** property works the same as UITextField's placeholder property.


Using KTTextView
----------------

To use KTTextView, copy the files KTTextView.h and KTTextView.m to your project. Replace UITextView in your source code and NIB files with KTTextView.


Properties
----------

**placeholderText**

The string displayed when there is no other text in the text view.

@property (nonatomic, copy) NSString *placeholderText;


**placeholderColor**

The color of the placeholder text. The default value is a light gray color.

@property (nonatomic, retain) UIColor *placeholderColor;


Screenshots
-----------

[![](http://farm6.static.flickr.com/5049/5243475037_be5c5c998f_m.jpg)](http://farm6.static.flickr.com/5049/5243475037_be5c5c998f_b.jpg)


Automatic Reference Counting (ARC) Support
==========================================

If you would like to use KTTextView in your ARC-enabled project, you must [add the `-fno-objc-arc` compiler flag](http://stackoverflow.com/questions/6646052/how-can-i-disable-arc-for-a-single-file-in-a-project) to the file KTTextView.m.

License
=======

The MIT License

Copyright (c) 2010 White Peak Software Inc

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.