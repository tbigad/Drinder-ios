//
//  KeyboardHeightObserver.m
//  keyBoardObserver
//
//  Created by Юлия Лопатина on 8/1/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "KeyboardHeightObserver.h"
#import "UIKit/UIKit.h"

@implementation KeyboardHeightObserver
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self subscribeOnKeyboardEvents];
    }
    return self;
}

- (void)subscribeOnKeyboardEvents {
    // Keyboard will show
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillShow:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
    // Keyboard will hide
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillHide:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
    
    // Keyboard will change frame
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillChangeFrame:)
                                               name:UIKeyboardWillChangeFrameNotification
                                             object:nil];
}

- (void)dealloc
{
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (void)keybaordWillShow:(NSNotification *)notification {
    CGRect rect = [(NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if(self.KeyBoardHeighChanged) {
        self.KeyBoardHeighChanged([NSNumber numberWithFloat:rect.size.height]);
    }
}

- (void)keybaordWillHide:(NSNotification *)notification {
    if(self.KeyBoardHeighChanged)
        self.KeyBoardHeighChanged([NSNumber numberWithFloat:0.0f]);
}

- (void)keybaordWillChangeFrame:(NSNotification *)notification {
    if(self.KeyBoardHeighChanged)
    {
        CGRect rect = [(NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        __block NSNumber *height = [NSNumber numberWithFloat:rect.size.height];
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.KeyBoardHeighChanged(height);
        });
    }
}


@end
