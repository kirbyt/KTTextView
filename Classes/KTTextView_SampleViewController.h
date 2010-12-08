//
//  KTTextView_SampleViewController.h
//  KTTextView-Sample
//
//  Created by Kirby Turner on 12/8/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KTTextView;

@interface KTTextView_SampleViewController : UIViewController 
{
   KTTextView *_textView;
}

@property (nonatomic, retain) IBOutlet KTTextView *textView;

@end

