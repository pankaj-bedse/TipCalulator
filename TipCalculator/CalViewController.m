//
//  CalViewController.m
//  TipCalculator
//
//  Created by Pankaj Bedse on 9/11/15.
//  Copyright (c) 2015 Pankaj Bedse. All rights reserved.
//

#import "CalViewController.h"
#import "SettingsViewController.h"

@interface CalViewController ()
@property (nonatomic) float tipPercentage;
@property (nonatomic, weak) UINavigationItem *navButton;
@end

@implementation CalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // initialize values
    _bill.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _total.text = @"";
    _tip.text = @"";
    self.tipPercentage = 0.1;
    [_bill addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipSegmentIndex = [defaults integerForKey:@"default_tip_percentage"];
    [self.segmentControl setSelectedSegmentIndex:defaultTipSegmentIndex];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateTipTotal
{
    CGFloat billFloat = (CGFloat)[_bill.text floatValue];
    float tip = (billFloat * self.tipPercentage);
    float total = billFloat + tip;
    
    _tip.text = [NSString stringWithFormat:@"$%.02f", tip];
    _total.text = [NSString stringWithFormat:@"$%.02f", total];
    NSLog(@"bill : %f , tip : %f, total : %f, %f", billFloat, tip, total, self.tipPercentage);
}

-(void)textFieldDidChange :(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    [self updateTipTotal];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

-(IBAction)UIControlEventValueChanged:(id)sender
{
    NSLog(@"%ld", (long)self.segmentControl.selectedSegmentIndex);
    switch (self.segmentControl.selectedSegmentIndex) {
        case 0:
            self.tipPercentage = 0.1;
            break;
        case 1:
            self.tipPercentage = 0.15;
            break;
        case 2:
            self.tipPercentage = 0.20;
            break;
        default:
            self.tipPercentage = 0.1;
            break;
    }
    [self updateTipTotal];
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
