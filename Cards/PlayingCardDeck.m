//
//  PlayingCardDeck.m
//  Cards
//
//  Created by hcc on 16/6/11.
//  Copyright © 2016年 linbao. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface PlayingCardDeck()

@end

@implementation PlayingCardDeck

-(instancetype) init
{
    self = [super init];
    if(self){
        for (NSString *suit in [PlayingCard validSuits]) {
            for(NSUInteger index = 1; index <= [PlayingCard maxRank]; index++ ){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = index;
                [self addCard:card atTop:NO];
            }
        }
    }
    return self;
}

@end