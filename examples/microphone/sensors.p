//
// sensors.p
// Properties Example
//
// This sensors.p script runs in the Sensors VM. It
// watches sensors and sets properties to notify the
// other scripts of certain events.
//
// The sensors used in this example are derived sensors
// and they may require that you use special methods to
// modify them. See the PDK documentation for more details.
//

// save space by packing all strings
#pragma pack 1

#include <Log.inc>
#include <Script.inc>
#include <Sensor.inc>
#include <Property.inc>
#include <Util.inc>
#include <Camera.inc>
#include <Motion.inc>


#include "user_properties.inc"

public init()
{
    print("sensors:init() enter\n");
    print("sensors:init() exit\n");
}

//new packets[256][256];
     new packet_buffer[64000]

new packet_count = 0

public on_sensor(time, sensor_name: sensor, value)
{
    new name[32];
    sensor_get_name(sensor, name);

    printf("sensors:on_sensor(%d, %s, %d)\n", time, name, value);

    printf("sensor == SENSOR_PACKET ? %d\n", sensor == SENSOR_PACKET)
    printf("sensor == SENSOR_PACKET ? %d\n", name == "SENSOR_PACKET")

    //reading audio file
    switch (sensor)
    {
        case SENSOR_PACKET:
        {
            printf("SENSOR_PACKET, mutha!!");
            sensor_read_data(SENSOR_PACKET, packet_buffer);                
//            printf("== SENSOR_PACKET: length:%d, data:%s ==\n", value, packet_buffer);
        }
        case SENSOR_SOUND_DIR:
        {
//            new sensor_buffer[16]
//            sensor_read_data(SENSOR_SOUND_DIR, sensor_buffer);
//            printf("== SENSOR_SOUND_DIR: :%d, data:%s ==\n", value, sensor_buffer);            
//David Meyer            
			//motion_play(mot_headright);
            //while (motion_is_playing(mot_headright))
            //{
            //    sleep;
            //}

            
            //headright
        }
    }
    log_flush()

    // reset sensor trigger
    return true
}

//        default:
//        {
//            printf("Unhandled sensor event: %d\n", sensor);        
//        }
//desiderata
//the planning fallacy

public close()
{
    print("sensors:close() enter\n");

    print("sensors:close() exit\n");
}
