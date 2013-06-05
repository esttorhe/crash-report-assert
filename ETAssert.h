//
//  ETAssert.h
//  
//
//  Created by Esteban Torres on 6/5/13.
//  Based on Mike Ash article - Proper Use Of Asserts [ http://www.mikeash.com/pyblog/friday-qa-2013-05-03-proper-use-of-asserts.html?utm_source=iOS+Dev+Weekly&utm_campaign=7dba454803-iOS_Dev_Weekly_Issue_93&utm_medium=email&utm_term=0_7bda94b7ca-7dba454803-267010305 ]
//

#ifndef _ETAssert_h
#define _ETAssert_h

// Variable added in the hopes of adding extra data to the crash report.
// Apparently doesn't work on iOS but having the variable causes no harm.
const char *__crashreporter_info__ = NULL;
asm(".desc _crashreporter_info, 0x10");

#define ETAssert(expression, ...) \
do { \
if(!(expression)) { \
NSString *__ETAssert_temp_string = [NSString stringWithFormat: @"### Assertion failure: %s - %s:%d[%s]. %@ ###", #expression, __FILE__, __LINE__, __func__, [NSString stringWithFormat: @"" __VA_ARGS__]]; \
NSLog(@"%@", __ETAssert_temp_string); \
__crashreporter_info__ = [__ETAssert_temp_string UTF8String]; \
abort(); \
} \
} while(0)
#endif
