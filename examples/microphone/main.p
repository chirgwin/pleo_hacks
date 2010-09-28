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
#include <Camera.inc>
#include <Util.inc>
#include <Time.inc>
#include <Sensor.inc>

#include "user_properties.inc"
#include "sounds.inc"
#include "motions.inc"

forward read_left_mic_to_file();
forward read_audio_file(file_name[]);
/*

forward fxlog(x);
forward autoCorrelate(windowedData);
forward estimateFrequency(data, stretchFactor);

//SENSOR_SOUND_LOUD
//SENSOR_SOUND_DIR
//SENSOR_SOUND_LOUD_CHANGE
//SENSOR_BEACON
//SENSOR_PACKET
//SENSOR_TRACKABLE_OBJECT


new P = 256 // r(k) order
#define BUFFER_SIZE 32;
new DEFAULT_SAMPLING_RATE = 9360;

new frameLength = 256
public var pitches:Array;
public var sampleRate:uint;
public var minNoteLengthFrames:uint = 4; //minimum note length in frames
private var _coefficient:Array;

public static const FFT:int = 1;
public static const IFFT:int = -1;
public static const A4:uint = 440;
private static const SHIFT_LENGTH:uint = 128; // shift length
private static const ENERGY_THRESHOLD:uint = 140;
private static const TWO_PI:Number = 2 * Math.PI;


private var _channel:SoundChannel;
private var _frameCount:uint = 0;
*/

//globals
new audiorecorded = -1;

new audio_file_locked = 0;

public init()
{
    print("main::init() enter\n");
    
    //Note: if we turn on the terminal, we all audio data goes to the log file
    //so it won't be captured by commands like `audio left file.wav 1`
    //monitor_exec("audio terminal on")
    //leave it off for now...
    monitor_exec("chdrv a")        
    // disable all log messages except 'script:'
    log_disable(MSG_ALL);
    log_enable(MSG_SCRIPT);
    log_set_file("pleo.log");

    // set the packet filter to send audio events
    //PACKET_AUDIO
    sensor_set_config(SENSOR_PACKET, sensor_config_packet_filter, PACKET_AUDIO);
    //357?
    
	print("main::init() exit\n");
    //Message(MSG_ALL, "foo");
    log_flush()
}

public main()
{
    print("main::main() enter\n")
//    sleep(5)
    //no audio file, so record some more from the left
    if (!file_exists("left.wav")  && audio_file_locked != 1)
    {
        read_left_mic_to_file();
    }
//        sleep(10)

    log_flush()
//sleep
}


read_left_mic_to_file()
{

//    motion_play(mot_headleft);
    //"audio " + mic + " " + filename + " " + seconds
    //mic is one of "left" "right" or "both"
    //record 10 seconds of audio
    monitor_exec("audio left left.wav 10")
//        audiorecorded = 1
    for (new i = 0; i < 15000; i ++)
    {
        sleep(10);
    }    
    read_audio_file("left.wav")
    log_flush();
}



read_audio_file(file_name[])
{    
    monitor_exec("chdrv a")        

    printf("reading audio file %s\n", file_name)

    if (!file_exists(file_name))
    {
        printf("%s doesn't exist\n", file_name)
        log_flush()        
        return false
    }
    
    new File: read_handle = file_open(file_name, io_read)
    new file_size = file_get_size(read_handle)
    printf ("file_size of %s is %d\n", file_name, file_size)
    //check length.... mmmmm, magic numbers
    //93324
    //93280
    //92268
    
    if (file_size < 92000)    
    {
        printf("%s isn't long enough, assume it's still being written, returning false\n", file_name)
        file_close(read_handle);
        log_flush()        
        return false    
    }

    //audio is 8-bit unsigned
    printf("reading audio file %s\n", file_name)
    new read_count

    //lock file so we don't write to it when listening
    audio_file_locked = 1;
    
    new bytes_to_read_default = 32
    new buffer[32]
    new bytes_remaining = file_size
    new bytes_to_read = bytes_to_read_default
    new num_bytes_read = 0
    while (bytes_remaining < file_size)
    {
        if (bytes_remaining < bytes_to_read_default)
        {
            bytes_to_read = bytes_remaining
        }
        else
        {
            bytes_to_read = bytes_to_read_default        
        }
        num_bytes_read = file_read(read_handle, buffer, false, bytes_to_read)
        printf("read %s", buffer);
        bytes_remaining -= num_bytes_read
    }

   //printf("read first chunkk of fir(l)e:  %s\n", file_read(read_handle, buffer, true, 32));
    
    //Double loop learning
    

//    new file_char
//    while (file_char = fgetchar(read_handle))
//    {
//        printf("read %s", char)
//    }

//        printf("file_gets returned %s (%d characters read [%d max])\n", string_buffer, read_count, sizeof(string_buffer));


    // Close the file, delete it, and make sure it doesn't exist
    printf("Closing %s...\n", file_name);
    file_close(read_handle);

    //delete when done
    file_delete(file_name);

    audio_file_locked = 0;

    log_flush()
}

/*

fxlog(x) 
{
    new t
    new y;

    y=0xa65af;
    if(x<0x00008000) x<<=16,              y-=0xb1721;
    if(x<0x00800000) x<<= 8,              y-=0x58b91;
    if(x<0x08000000) x<<= 4,              y-=0x2c5c8;
    if(x<0x20000000) x<<= 2,              y-=0x162e4;
    if(x<0x40000000) x<<= 1,              y-=0x0b172;
    t=x+(x>>1); if((t&0x80000000)==0) x=t,y-=0x067cd;
    t=x+(x>>2); if((t&0x80000000)==0) x=t,y-=0x03920;
    t=x+(x>>3); if((t&0x80000000)==0) x=t,y-=0x01e27;
    t=x+(x>>4); if((t&0x80000000)==0) x=t,y-=0x00f85;
    t=x+(x>>5); if((t&0x80000000)==0) x=t,y-=0x007e1;
    t=x+(x>>6); if((t&0x80000000)==0) x=t,y-=0x003f8;
    t=x+(x>>7); if((t&0x80000000)==0) x=t,y-=0x001fe;
    x=0x80000000-x;
    y-=x>>15;
    return y;
}
   
    
log10(x)
{
//    0.4342944819032518
}
  
log(x)
{

}
autoCorrelate(windowedData)
{
    new r
    new n
    new autoCorrelation[P];
    
    for (r = 0; r < P; r++)
    {
        autoCorrelation[r] = 0.0;
        for (n = 0; n < frameLength - r; n++)
        {
            //dot product
            autoCorrelation[r] += windowedData[n] * windowedData[n + r];
        }
        autoCorrelation[r] /= frameLength;
    }
        log_flush()        
    return autoCorrelation;
}


estimateFrequency(data, stretchFactor)
{
    new byteCount = 0;
    var val = [];
    var haveData:Boolean = false;

    //while (data.bytesAvailable && byteCount < 256) 
    for (new i; i < ; i ++) 
    {
        vals[byteCount] = data.readInt();
         //trace("frame", _frameCount); 
         //trace("byte", byteCount); 
        if (vals[byteCount] > 0)
        {
            haveData = true;
        }
    } 
    var frequency:Number = -1;            
    if (haveData)
    {
        new autoCorrelation = autoCorrelate(vals);
        frequency = getPitch(autoCorrelation, DEFAULT_SAMPLING_RATE/(stretchFactor + 1));
    }
    log_flush()        
    return frequency;
}
audio_byte_index ++

var audio_data = [NUM_BYTES][BUFFER_SIZE]
*/


public close()
{
    print("main:close() enter\n");

    print("main:close() exit\n");
}
