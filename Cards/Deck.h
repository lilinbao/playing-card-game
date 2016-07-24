//
//  Deck.h
//  Cards
//
//  Created by hcc on 16/6/10.
//  Copyright © 2016年 linbao. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck: NSObject
- (void) addCard:(Card *)card atTop:(BOOL) atTop;
- (Card *) drawRandomCard;
@end
