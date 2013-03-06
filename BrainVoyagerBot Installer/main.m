//
//  main.m
//  BrainVoyagerBot Installer
//
//  Created by Deb on 1/25/13.
//  Copyright (c) 2013 Deb. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, char *argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, (const char **)argv);
}
