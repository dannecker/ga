//
//  ReaderAdvertisersViewController.m
//  General Aviation
//
//  Created by Alex Burov on 1/7/15.
//
//

#import "ReaderAdvertisersViewController.h"

@interface ReaderAdvertisersViewController ()
@property (strong, nonatomic) UIView *toolBar;
@end

@implementation ReaderAdvertisersViewController

#pragma mark - Constants

#define TOOLBAR_HEIGHT 50.0f
#define BUTTON_HEIGHT 40.0f
#define BUTTON_WIDTH 80.0f
#define STATUS_HEIGHT 0.0f


- (instancetype)initWithPathToAds:(NSURL *)path
{
    self = [super init];
    if (self) {
        
        NSString *pathToAds = [[[path path] stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"ads.html"];
        NSURL *url = [NSURL fileURLWithPath:pathToAds];
        self.request = [NSURLRequest requestWithURL:url];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, TOOLBAR_HEIGHT + STATUS_HEIGHT, self.view.bounds.size.width, self.view.bounds.size.height - 40)];
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.webView.delegate = self;
    [self.webView loadRequest:self.request];
    
    [self.view addSubview:self.webView];
    
    self.toolBar = [[UIView alloc]initWithFrame:CGRectMake(0, STATUS_HEIGHT, CGRectGetWidth(self.view.bounds), TOOLBAR_HEIGHT)];
    self.toolBar.backgroundColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0f];
    self.toolBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.toolBar];
    
    UIButton *disMissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    disMissButton.frame = CGRectMake(5, 5, BUTTON_WIDTH, BUTTON_HEIGHT);
    disMissButton.backgroundColor = [UIColor clearColor];
    [disMissButton addTarget:self action:@selector(disMissButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [disMissButton setTitle:@"Back" forState:UIControlStateNormal];
    [disMissButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [disMissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.toolBar addSubview:disMissButton];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(CGRectGetWidth(self.toolBar.bounds) - BUTTON_WIDTH * 2 - 5, 5, BUTTON_WIDTH * 2, BUTTON_HEIGHT);
    backButton.backgroundColor = [UIColor clearColor];
    backButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setTitle:@"Advertisers" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.toolBar addSubview:backButton];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    self.webView = nil;
}

#pragma mark - Actions

- (void)disMissButtonAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)backButtonAction:(UIButton *)sender{
    [self.webView loadRequest:self.request];
    //[self.webView reload];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSLog(@"shouldStartLoadWithRequest %@", [request debugDescription]);
  
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
