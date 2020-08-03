//
//  MoreTableViewCell.m
//  Drinder-ios
//
//  Created by Юлия Лопатина on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "MoreTableViewCell.h"

@implementation MoreTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+(NSString *)reusableId {
    return NSStringFromClass([MoreTableViewCell class]);
}
@end
