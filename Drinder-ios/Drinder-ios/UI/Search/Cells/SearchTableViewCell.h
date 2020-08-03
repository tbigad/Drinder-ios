//
//  SearchTableViewCell.h
//  Drinder-ios
//
//  Created by Юлия Лопатина on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleTextLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionTextLabel;
+(NSString *)reusableId ;
@end

NS_ASSUME_NONNULL_END
