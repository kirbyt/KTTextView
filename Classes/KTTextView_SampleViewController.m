//
//  KTTextView_SampleViewController.m
//  KTTextView-Sample
//
//  Created by Kirby Turner on 12/8/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "KTTextView_SampleViewController.h"
#import "KTTextView.h"

@implementation KTTextView_SampleViewController

@synthesize textView = _textView;

- (void)dealloc 
{
   [_textView release], _textView = nil;
   [super dealloc];
}

- (void)viewDidLoad 
{
   [super viewDidLoad];
   
   [_textView setPlaceholderText:@"Touch to add text."];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
   return YES;
}

- (void)didReceiveMemoryWarning 
{
	// Releases the view if it doesn't have a superview.
   [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload 
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
   
   [self setTextView:nil];
}



@end
