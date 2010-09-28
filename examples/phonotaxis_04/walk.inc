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
                motion_play(mot_com_walk_fs)
            }
        }
        case (1):
        {
            if (!motion_is_playing(mot_com_walk_fl_2a))
            {
                //turn head to the left
                motion_play(mot_headleft);
                motion_play(mot_com_walk_fl_2a);
            }
        }
        case (2):
        {
            if (!motion_is_playing(mot_com_walk_fr_2a))
            {
                //turn head to the right
                motion_play(mot_headright);
                //walk forward right
                motion_play(mot_com_walk_fr_2a)
            }
        }
        case (3):
        {
            if (!motion_is_playing(mot_com_walk_bl_2a))
            {
                //turn head to the left
                motion_play(mot_headleft);
                //walk back left
                motion_play(mot_com_walk_bl_2a)
            }
        }
        case (4):
        {
            if (!motion_is_playing(mot_com_walk_br_2a))
            {
                //turn head to the right
                motion_play(mot_headright);
                //walk back right
                motion_play(mot_com_walk_br_2a)
            }
        }
        default:
        {
            if (!motion_is_playing(mot_com_walk_fs))
            {
                motion_play(mot_com_walk_fs)
            }
        }
    }
}