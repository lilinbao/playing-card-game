//
//  PlayingCardViewController.m
//  Cards
//
//  Created by hcc on 16/7/24.
//  Copyright © 2016年 linbao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCardViewController.h"
#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardViewController : ViewController{}

@end

@implementation PlayingCardViewController

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

@end
