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

//forward public photo(zahl);

public init()
{
    print("main::init() enter\n");
	print("main::init() exit\n");
}

new picture_taken = -1

public main()
{
        //print("main::main() enter\n")
        //sleep(5)
        if (picture_taken == -1)
        {
            monitor_exec("chdrv a")        
            monitor_exec("camera capture FO.bmp BMP new")
            sleep(20)        
            picture_taken = 1
        }
        
        new sound_speed = 25
        sound_speed = rand(250)
        new horn_num = rand(2)
        if (sound_speed < 25 || sound_speed > 200)
        {
            sound_speed = 150
        }
        
        sound_set_speed(sound_speed);

        if (horn_num == 2)
        {
            sound_play(snd_french_horn_02)
        }
        else
        {
            sound_play(snd_french_horn_01)
        }
        
        return
}


public close()
{
    print("main:close() enter\n");

    print("main:close() exit\n");
}
