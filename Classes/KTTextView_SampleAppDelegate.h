//
//  KTTextView_SampleAppDelegate.h
//  KTTextView-Sample
//
//  Created by Kirby Turner on 12/8/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KTTextView_SampleViewController;

@interface KTTextView_SampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    KTTextView_SampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet KTTextView_SampleViewController *viewController;

@end

