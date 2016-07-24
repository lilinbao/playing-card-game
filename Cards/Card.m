//
//  Card.m
//  Cards
//
//  Created by hcc on 16/6/10.
//  Copyright © 2016年 linbao. All rights reserved.
//

#import "Card.h"

@interface Card ()

@end

@implementation Card

- (int) match:(NSArray *)otherCards{
    int score = 0;
    for (Card *card in otherCards) {
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}


-(BOOL) isMatched:(Card *) otherCard{
    return [self.contents isEqualToString:otherCard.contents] ? YES: NO;
}

@end