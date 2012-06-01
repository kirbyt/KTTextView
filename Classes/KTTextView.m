//
//  KTTextView.m
//
//  Created by Kirby Turner on 10/29/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//
//  The MIT License
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "KTTextView.h"

@interface KTTextView ()
@property (nonatomic, retain) UILabel *placeholder;
@end

@implementation KTTextView

//@synthesize placeholderText = _placeholderText;
//@synthesize placeholderColor = _placeholderColor;
@synthesize placeholder = _placeholder;

- (void)dealloc
{
   [[NSNotificationCenter defaultCenter] removeObserver:self];
   
   [_placeholder release], _placeholder = nil;
   
   [super dealloc];
}

- (void)setup
{
   if ([self placeholder]) {
      [[self placeholder] removeFromSuperview];
      [self setPlaceholder:nil];
   }
   
   CGRect frame = CGRectMake(8, 8, self.bounds.size.width - 16, 0.0);
   UILabel *placeholder = [[UILabel alloc] initWithFrame:frame];
   [placeholder setLineBreakMode:UILineBreakModeWordWrap];
   [placeholder setNumberOfLines:0];
   [placeholder setBackgroundColor:[UIColor clearColor]];
   [placeholder setAlpha:1.0];
   [placeholder setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
   [placeholder setTextColor:[UIColor lightGrayColor]];
   [placeholder setText:@""];
   [self addSubview:placeholder];
   [self sendSubviewToBack:placeholder];
   
   [self setPlaceholder:placeholder];
   [placeholder release];

   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getFocus:) name:UITextViewTextDidBeginEditingNotification object:nil];
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lostFocus:) name:UITextViewTextDidEndEditingNotification object:nil];
}

- (void)awakeFromNib
{
   [super awakeFromNib];
   [self setup];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
   self = [super initWithCoder:aDecoder];
   if (self) {
      [self setup];
   }
   return self;
}

- (id)initWithFrame:(CGRect)frame
{
   self = [super initWithFrame:frame];
   if (self) {
      [self setup];
   }
   return self;
}

- (void)textChanged:(NSNotification *)notification
{
   if ([[_placeholder text] length] == 0) {
      return;
   }
   
   if ([[self text] length] == 0) {
      [_placeholder setAlpha:1.0];
   } else {
      [_placeholder setAlpha:0.0];
   }
}

- (void)getFocus:(NSNotification *)notification
{
    [_placeholder setAlpha:0.0];
}

- (void)lostFocus:(NSNotification *)notification
{
    if ([[self text] length] == 0) {
        [_placeholder setAlpha:1.0];
    } else {
        [_placeholder setAlpha:0.0];
    }
}

- (void)drawRect:(CGRect)rect
{
   [super drawRect:rect];
   if ([[self text] length] == 0 && [[_placeholder text] length] > 0) {
      [_placeholder setAlpha:1.0];
   } else {
      [_placeholder setAlpha:0.0];
   }
}

- (void)setFont:(UIFont *)font
{
   [super setFont:font];
   [_placeholder setFont:font];
}

- (NSString *)placeholderText
{
   return [_placeholder text];
}

- (void)setPlaceholderText:(NSString *)placeholderText
{
   [_placeholder setText:placeholderText];
   
   CGRect frame = _placeholder.frame;
   CGSize constraint = CGSizeMake(frame.size.width, 42.0f);
   CGSize size = [placeholderText sizeWithFont:[self font] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];      
   
   frame.size.height = size.height;
   [_placeholder setFrame:frame];
}

- (UIColor *)placeholderColor
{
   return [_placeholder textColor];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
   [_placeholder setTextColor:placeholderColor];
}

@end
