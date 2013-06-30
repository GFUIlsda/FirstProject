//
//  ITBook.m
//  ITBook
//
//  Created by SkyLORD on 14.06.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

// <challenge the directive #import, shall connect a type library that describes the use of COM interfaces>
#import "ITBook.h"

// <ad constants is a good way to make these constants defined once for the whole app>
static NSString *const sITBookDefaultTitle = @"Unknown";
static NSString *const sITBookDefaultAuthor = @"No Name";

NSString *const kITBookTitleKey = @"title";
NSString *const kITBookAuthorKey = @"author";
NSString *const kITBookYearKey = @"year";
NSString *const kITBookPaperbackKey = @"paperback";


@implementation ITBook

//описание работы методов в проекте (пистолет прилагается)

//НОВОЕ!!!
@synthesize title = _title, author = _author, year = _year, hardcover = _hardcover;
//Закрытие НОВОГО!!!

- (id)initWithTitle:(NSString *)aTitle
{
    return [self initWithTitle:aTitle author:nil year:0 paperback:NO];
}

- (id)initWithTitle:(NSString *)aTitle author:(NSString *)anAuthor
{
    return [self initWithTitle:aTitle author:anAuthor year:0 paperback:NO];
}

- (id)initWithTitle:(NSString *)aTitle author:(NSString *)anAuthor year:(NSInteger)aYear
{
    return [self initWithTitle:aTitle author:anAuthor year:0 paperback:NO];
}

- (id)initWithTitle:(NSString *)aTitle author:(NSString *)anAuthor year:(NSInteger)aYear paperback:(BOOL)aCoverType
{
    self = [super init];
    if (self)
    {
        self.title = aTitle;
        self.author = anAuthor;
        self.year = aYear;
        self.paperback = aCoverType;
    }
    return self;
}

//НОВОЕ!!!
#pragma mark -

- (id)initWithDictionaryRepresentation:(NSDictionary *)aDict
{
	self = [super init];
	if (self)
	{
		self.title = [aDict objectForKey:kITBookTitleKey];
		self.author = [aDict objectForKey:kITBookAuthorKey];
		self.year = [[aDict objectForKey:kITBookYearKey] integerValue];
		[self setPaperback:[[aDict objectForKey:kITBookPaperbackKey] boolValue]];
	}
	
	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *theRepresentation = [NSMutableDictionary dictionary];
	
	if (nil != self.title || NO == [sITBookDefaultTitle isEqualToString:self.title])
	{
		[theRepresentation setObject:self.title forKey:kITBookTitleKey];
	}
	
	if (nil != self.author)
	{
		[theRepresentation setObject:self.author forKey:kITBookAuthorKey];
	}
	
	[theRepresentation setObject:@(self.year) forKey:kITBookYearKey];
	[theRepresentation setObject:@(self.isPaperback) forKey:kITBookPaperbackKey];
	
	return [[theRepresentation copy] autorelease];
}
//Закрытие НОВОЕ!!!


- (void)dealloc
{
    [_title release];
    [_author release];
	
    [super dealloc];
}


#pragma mark -
- (void)setTitle:(NSString *)aTitle
{
    if (_title != aTitle)
    {
        [_title autorelease];
        _title = [aTitle copy];
    }
}

- (NSString *)title
{
    return (nil == _title) ? sITBookDefaultTitle : _title;
}

- (void)setAuthor:(NSString *)anAuthor
{
    if (_author != anAuthor)
    {
        [_author autorelease];
        _author = [anAuthor copy];
    }
}

- (NSString *)author
{
    return _author;
}

- (void)setYear:(NSInteger)aYear
{
    if (_year != aYear)
    {
        _year = aYear;
    }
}

- (NSInteger)year
{
    return _year;
}


- (void)setPaperback:(BOOL)isPaperback
{
    if (_coverType != isPaperback)
    {
        _coverType = isPaperback;
    }
}

- (BOOL)isPaperback
{
    return _coverType;
}

- (void)setHardcover:(BOOL)isHardcover
{
    if (_coverType == isHardcover)
    {
        _coverType = isHardcover;
    }
}

- (BOOL)isHardcover
{
    return !_coverType;
}

#pragma mark -
- (NSString *)stringRepresentation
{
    NSString * theCoverTypeStringRepresentahion = self.isPaperback ? @"Paperback": @"Hardcover";
	 
	return [NSString stringWithFormat:@"Title:%@. Author:%@. Year:%ld. Covertype:%@.", self.title, nil == self.author ? sITBookDefaultAuthor : self.author , self.year, theCoverTypeStringRepresentahion];
}

#pragma mark -

+ (NSArray *)booksSortByTitleWithSet:(NSSet *)aBooks
{
    return [aBooks.allObjects sortedArrayUsingSelector:@selector(isEqualByTitle:)];
}

+ (NSArray *)booksSortByAuthorWithSet:(NSSet *)aBooks
{
    return [aBooks.allObjects sortedArrayUsingSelector:@selector(isEqualByAuthor:)];
}

+ (NSArray *)booksSortByYearWithSet:(NSSet *)aBooks
{
    return [aBooks.allObjects sortedArrayUsingSelector:@selector(isEqualByYear:)];
}

+ (NSArray *)booksSortByTitleWithArray:(NSArray *)aBooks
{
    return [aBooks sortedArrayUsingSelector:@selector(isEqualByTitle:)];
}

+ (NSArray *)booksSortByAuthorWithArray:(NSArray *)aBooks
{
    return [aBooks sortedArrayUsingSelector:@selector(isEqualByAuthor:)];
}

+ (NSArray *)booksSortByYearWithArray:(NSArray *)aBooks
{
     return [aBooks sortedArrayUsingSelector:@selector(isEqualByYear:)];
}

#pragma mark -
- (NSComparisonResult)isEqualByTitle:(ITBook *)aBook
{
    return [self.title compare:aBook.title];
}

- (NSComparisonResult)isEqualByAuthor:(ITBook *)aBook
{
    return [self.author compare:aBook.author];
}

- (NSComparisonResult)isEqualByYear:(ITBook *)aBook
{
    if (self.year > aBook.year)
    {
        return NSOrderedAscending;
    }
    if (self.year < aBook.year) {
        return NSOrderedDescending;
    }
    return NSOrderedSame;
}

@end
