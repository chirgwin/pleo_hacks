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

new sound_speed = 25
#define MIN_SOUND_SPEED = 50
#define MAX_SOUND_SPEED = 250
#define DEFAULT_SOUND_SPEED = 100

#define OCTAVE = 2/1
#define PERFECT_FIFTH = 3/2
#define PERFECT_FOURTH = 4/3
#define MAJOR_THIRD = 5/4
#define MINOR_THIRD = 6/5
#define MAJOR_SIXTH = 5/3
#define MINOR_SIXTH = 8/5

#define NUM_INTERVALS = 7

new INTERVALS[7]

public init()
{
    print("main::init() enter\n");
	print("main::init() exit\n");
    INTERVALS = {2/1, 3/2, 4/3, 5/4, 6/5, 5/3, 8/5};
}

public main()
{
//    if (!sound_is_playing(snd_french_horn_03))
 //   {
        //new last_sound_speed = sound_speed
        //sound_speed = rand(250)
        new interval_idx = rand(7)
        
        /*
        if (sound_speed == last_sound_speed)
        {
            sound_speed = last_sound_speed - 20
        }
        if (sound_speed < MIN_SOUND_SPEED || sound_speed > MIN_SOUND_SPEED)
        {
            sound_speed = 150
        }
        */
        
        //sound_speed = INTERVALS[interval_idx] * 100
        //sound_set_speed(sound_speed)
        if (sound_is_playing(snd_french_horn_03))
        {
            sound_stop(snd_french_horn_03)
        }
        for (new i; i < 2000; i ++)
        {
            sleep
        }
        sound_play(snd_french_horn_03)
//    }
}


public close()
{
    print("main:close() enter\n");

    print("main:close() exit\n");
}
