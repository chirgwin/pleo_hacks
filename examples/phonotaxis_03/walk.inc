//
// walk.inc
// Permian Phonotaxis
// Geoff Chirgwin

#include <Motion.inc>
#include "user_properties.inc"
#include "motions.inc"

forward public walk()

new walking_direction = 0;

public walk()
{
    //allow current motion to complete
    
    if (motion_is_playing(mot_com_walk_fs) || 
        motion_is_playing(mot_com_walk_fl_2a) ||
        motion_is_playing(mot_com_walk_fr_2a) ||
        motion_is_playing(mot_com_walk_bl_2a) ||
        motion_is_playing(mot_com_walk_br_2a))
        {
            return false;
        }
        
    
    switch (walking_direction)
    {    
        case (0):
        {
            if (!motion_is_playing(mot_com_walk_fs))
            {
                print ("walking forward\n");
                motion_play(mot_com_walk_fs)
            }
        }
        case (1):
        {
            if (!motion_is_playing(mot_com_walk_fl_2a))
            {
                print ("walking forward\n");
                motion_play(mot_com_walk_fl_2a)
            }
        }
        case (2):
        {
            if (!motion_is_playing(mot_com_walk_fr_2a))
            {
                print ("walking forward\n");
                motion_play(mot_com_walk_fr_2a)
            }
        }
        case (3):
        {
            if (!motion_is_playing(mot_com_walk_bl_2a))
            {
                print ("walking forward\n");
                motion_play(mot_com_walk_bl_2a)
            }
        }
        case (4):
        {
            if (!motion_is_playing(mot_com_walk_br_2a))
            {
                print ("walking forward\n");
                motion_play(mot_com_walk_br_2a)
            }
        }
        default:
        {
            if (!motion_is_playing(mot_com_walk_fs))
            {
                print ("walking forward\n");
                motion_play(mot_com_walk_fs)
            }
        }
    }
}