//
//  ViewController.m
//  MySafari
//
//  Created by Barbara Hovantzi on 1/9/14.
//  Copyright (c) 2014 Diane Hovantzi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    __weak IBOutlet UIWebView *myWebView;
    
    __weak IBOutlet UITextField *myURLTextField;
}
@end

@implementation ViewController


- (IBAction)onBackButtonPressed:(id)sender {
    
    [myWebView goBack];
    
    
}

- (IBAction)onForwardButtonPressed:(id)sender {
    
    [myWebView goForward];
}

- (IBAction)onStopLoadingButtonPressed:(id)sender {
    
    [myWebView stopLoading];
    
}

- (IBAction)onReloadButtonPressed:(id)sender {
    
    [myWebView reload];
    
}


- (IBAction)onFeatureButtonPressed:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Coming Soon!" message: nil delegate: nil cancelButtonTitle: @"Dismiss" otherButtonTitles: nil];
    
    [alert show];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    myWebView.scrollView.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *myText;
    NSString *prefix = @"http://";
    
    if ([textField.text hasPrefix:@"http://"]) {
        myText = textField.text;
    }
    else {
        myText = [prefix stringByAppendingString:textField.text];
    }
    
    NSURL *url = [NSURL URLWithString:myText];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    [myWebView loadRequest: request];
    
    [textField resignFirstResponder];
    return YES;
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.dragging == YES ){
        myURLTextField.hidden = YES;
    }
    else {
        myURLTextField.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
