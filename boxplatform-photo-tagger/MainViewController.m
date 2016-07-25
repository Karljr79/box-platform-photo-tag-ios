//
//  ViewController.m
//  boxplatform-photo-tagger
//
//  Created by Karl Hirschhorn on 7/6/16.
//  Copyright © 2016 Karl Hirschhorn. All rights reserved.
//

#import "MainViewController.h"
#import <AFNetworking.h>

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *txtUsername;
@property (weak, nonatomic) IBOutlet UILabel *txtAppUserId;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //show a spinner
    [self.view addSubview:_spinner];
    [_spinner startAnimating];
    
    //grab contents of config.plist
    NSURL *file = [[NSBundle mainBundle] URLForResource:@"config" withExtension:@"plist"];
    NSDictionary *plistContent = [NSDictionary dictionaryWithContentsOfURL:file];
    
    //grab hard-coded app user id from the config.plist
    NSString *boxAppUserId = [plistContent objectForKey:@"boxAppUserId"];
    NSString *sampleApiUrl = [plistContent objectForKey:@"sampleApiUrl"];
    
    // Grab the Box App User's access token from the server.
    NSString *url = [sampleApiUrl stringByAppendingString:boxAppUserId];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        //update username text field
        _txtUsername.text = [responseObject valueForKey:@"name"];
        _txtAppUserId.text = [responseObject valueForKey:@"user_id"];
        
        //Grab a user-scoped access token from the server and store it in the NSUserDefaults
        //Handling an access token this way is not recommended for a production app!
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:[responseObject valueForKey:@"access_token"] forKey:@"access_token"];
        [defaults synchronize];
        
        [_spinner stopAnimating];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error fetching access token: %@", error);
    }];
}

@end
