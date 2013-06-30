//
//  ITBook.h
//  ITBook
//
//  Created by SkyLORD on 14.06.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

// <challenge the directive #import, shall connect a type library that describes the use of COM interfaces>
#import <Foundation/Foundation.h>

// <creating a scripted class "ITBook" and ad parents class name "NSObject", you specify the class interface in an @interface...@end>
@interface ITBook : NSObject

// declaration of variables in the project member variable declarations:
{
    NSString *_title;
    NSString *_author;
    NSInteger _year;
    BOOL _coverType;
}

// <given the following class declaration>
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign, getter = isPaperback) BOOL paperback;
@property (nonatomic, assign, getter = isHardcover) BOOL hardcover;

// ad processing methods in the project:
- (id)initWithTitle:(NSString *)aTitle;
- (id)initWithTitle:(NSString *)aTitle author:(NSString *)anAuthor;
- (id)initWithTitle:(NSString *)aTitle author:(NSString *)anAuthor year:(NSInteger)aYear;
- (id)initWithTitle:(NSString *)aTitle author:(NSString *)anAuthor year:(NSInteger)aYear paperback:(BOOL)aCoverType;

// <description of pointers to type of information>
- (void)setTitle:(NSString *)aTitle;
- (NSString *)title;
- (void)setAuthor:(NSString *)anAuthor;
- (NSString *)author;
- (void)setYear:(NSInteger)aYear;
- (NSInteger)year;
- (void)setPaperback:(BOOL)isPaperback;
- (BOOL)isPaperback;
- (void)setHardcover:(BOOL)isHardcover;
- (BOOL)isHardcover;

// <ad NSDictionary for need a convenient and efficient way to retrieve data associated with an arbitrary key>
- (id)initWithDictionaryRepresentation:(NSDictionary *)aDict;
- (NSDictionary *)dictionaryRepresentation;

- (NSString *)stringRepresentation;

// sorting the input data:
+ (NSArray *)booksSortByTitleWithSet:(NSSet *)aBooks;
+ (NSArray *)booksSortByAuthorWithSet:(NSSet *)aBooks;
+ (NSArray *)booksSortByYearWithSet:(NSSet *)aBooks;

+ (NSArray *)booksSortByTitleWithArray:(NSArray *)aBooks;
+ (NSArray *)booksSortByAuthorWithArray:(NSArray *)aBooks;
+ (NSArray *)booksSortByYearWithArray:(NSArray *)aBooks;

@end
