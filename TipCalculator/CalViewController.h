//
//  CalViewController.h
//  TipCalculator
//
//  Created by Pankaj Bedse on 9/11/15.
//  Copyright (c) 2015 Pankaj Bedse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalViewController : UIViewController
@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentControl;
@property (nonatomic, weak) IBOutlet UITextField *bill;
@property (nonatomic, weak) IBOutlet UILabel *tip;
@property (nonatomic, weak) IBOutlet UILabel *total;
@end
