//
// main.p
// extended Properties Example
// 
// Version 0.2
//
// 0.2: pleo now take photos correctly but give him some time!
//
// This very simple main script, which runs in the
// Main VM, demonstrates the
// use of Pleo's properties system to communicate
// between scripts running in different VMs.
//

// save space by packing all strings
#pragma pack 1

#pragma tabsize 0
//
#include <Log.inc>
#include <Script.inc>
#include <Property.inc>
#include <Sound.inc>
#include <Motion.inc>
#include <File.inc>
#include <String.inc>
#include <Script.inc>
#include <Camera.inc>
#include <Util.inc>
#include <Time.inc>


#include "user_properties.inc"
#include "sounds.inc"
#include "motions.inc"
#include "walk.inc"

#define MIN_SOUND_SPEED = 50
#define MAX_SOUND_SPEED = 250
#define DEFAULT_SOUND_SPEED = 100
#define FORWARD = 0

// 2/1
#define OCTAVE = 2/1;
// 3/2
#define PERFECT_FIFTH = 1.5;
// 4/3
#define PERFECT_FOURTH = 1.3333; 
// 5/4
#define MAJOR_THIRD = 1.25;
// 6/5
#define MINOR_THIRD = 1.2;
// 5/3
#define MAJOR_SIXTH = 1.6666;
// 8/5
#define MINOR_SIXTH = 1.6;
#define INTERVAL_IDX = rand(7)
#define NUM_INTERVALS = 7

//globals
new sound_speed = 100

public init()
{
    log_disable(MSG_ALL);
    log_enable(MSG_SCRIPT);
    log_set_file("pleo.log");
    
    print("main::init() enter\n");
    walk();
    seed(time())
    new interval_idx = rand(14)
    printf("interval_idx %d\n", interval_idx);
    sound_set_volume(200);
    switch (interval_idx)
    {
        case(0):
        {
            sound_speed *= 2;
            printf("sound_speed %d\n", sound_speed);
        }
        case(1):
        {
            sound_speed *= 3;
            sound_speed /= 2;
            printf("sound_speed %d\n", sound_speed);
        }
        case(2):
        {
            sound_speed *= 4;
            sound_speed /= 3;
            printf("sound_speed %d\n", sound_speed);
        }
        case(3):
        {
            sound_speed *= 5;
            sound_speed /= 4;
            printf("sound_speed %d\n", sound_speed);
        }
        case(4):
        {
            sound_speed *= 6;
            sound_speed /= 5;            
            printf("sound_speed %d\n", sound_speed);
        }
        case(5):
        {
            sound_speed *= 5;
            sound_speed /= 3;
            printf("sound_speed %d\n", sound_speed);
        }
        case(6):
        {
            sound_speed *= 8;
            sound_speed /= 5;
            printf("sound_speed %d\n", sound_speed);
        }    
        case(7):
        {
            sound_speed /= 2;
            printf("sound_speed %d\n", sound_speed);
        }
        case(8):
        {
            sound_speed /= 3;
            sound_speed *= 2;
            printf("sound_speed %d\n", sound_speed);
        }
        case(9):
        {
            sound_speed /= 4;
            sound_speed *= 3;
            printf("sound_speed %d\n", sound_speed);
        }
        case(10):
        {
            sound_speed /= 5;
            sound_speed *= 4;
            printf("sound_speed %d\n", sound_speed);
        }
        case(11):
        {
            sound_speed /= 6;
            sound_speed *= 5;
            printf("sound_speed %d\n", sound_speed);
        }
        case(12):
        {
            sound_speed /= 5;
            sound_speed *= 3;            
            printf("sound_speed %d\n", sound_speed);
        }
        case(13):
        {
            sound_speed /= 8;
            sound_speed *= 5;            
            printf("sound_speed %d\n", sound_speed);
        }    
    }
    if (sound_speed < 25)
    {
        sound_speed = 50
    }
    else if (sound_speed > 100)
    {
        sound_speed = 200
    }
    
    sleep
    
    printf("sound_speed %d\n", sound_speed);
	print("main::init() exit\n");
    log_flush();
}

public main()
{
    print("main::main() enter\n");

    if (!sound_is_playing(snd_french_horn_03))
    {
        printf("playing sound at speed %d", sound_speed)
        sound_set_speed(sound_speed);                     

        sound_play(snd_french_horn_03);
        for (new i; i < 10000; i ++)
        {
            walk()
            sleep
        }
        
    }
    sleep

    print("main::main() exit\n");
    log_flush();
}


public close()
{
    print("main:close() enter\n");

    print("main:close() exit\n");
}
