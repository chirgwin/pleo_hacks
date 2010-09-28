/*
	//variables for filenames

	new file_name[] = "";
    new file_base_name[] = "camera";
	new file_number = 0;
    new camera_command[] = "";
	new file_number_str[32];
    
    // The main VM will run the main() function again and
    // again once it returns, but this infinite for loop is
    // inserted to keep the main() function from returning.

    //change drive to SD-card
    monitor_exec("chdrv a")

    for (;;)
    {
        string_concat(file_name,".bmp")

        //assemble filename
        //reset to base name
        string_copy(file_name, file_base_name)

        //append number, first converting to string, base 10
        itoa(file_number, 10, file_number_str)
        string_concat(file_name, file_number_str)
        
        //append extension
        string_concat(file_name,".bmp")
                
        
        //capture image
        string_copy(camera_command, "camera capture ")
        string_concat(camera_command, file_name)
        string_concat(camera_command, " BMP new")
        
        monitor_exec(camera_command);
        
//        monitor_exec(file_name)	
        
        //time for pleo to save the photo
//        for (new i=0;i<2000;i++)
//        {
//            sleep;
//        }	
                
        //play sound the check if the photo was taken
        sound_play(snd_moo);

        while(sound_is_playing(snd_moo))
        {
            sleep;
        }

        file_number++;	