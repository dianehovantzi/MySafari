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




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSURL *url = [NSURL URLWithString:textField.text];
    
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    [myWebView loadRequest: request];
    
    return YES;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
