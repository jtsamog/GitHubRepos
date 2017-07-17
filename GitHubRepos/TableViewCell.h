//
//  TableViewCell.h
//  GitHubRepos
//
//  Created by Endeavour2 on 7/17/17.
//  Copyright © 2017 SamOg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelCell;
@property (weak, nonatomic) IBOutlet UILabel *repoIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *repoDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *repoURLLabel;

@end
