Pleo Hacks
==========

These are a collection of hacks I did a while back using the Pleo SDK that resulted in a public demonstration.  

* Most involve sound.
* All are based on the provided examples.
* All likely contain bugs.

I don't own a Pleo, so I'm not actively developing this.  It's possible some of this code won't work if the Pleo Development Kit (PDK) has changed since the code was written.

Since I found it very difficult to find resources when writing this stuff, I'm sharing the result here.

Code contributions and feedback are welcome.

Building
--------
The version used in the demonstration is phonotaxis_03.
Other directories contain experimental applications.
The directory 'phonotaxis_04' contains various post-demonstration experiments, 
including some based on feedback from the demonstration.

In order to compile the Pleo programs, the Pleo Development Kit (PDK) is required.  
The PDK can be downloaded here: http://www.pleoworld.com/downloads/pdk.aspx

Copy the entire 'examples' directory into the 'PleoDevelopmentKit' directory 
(possibly replacing the default 'examples' directory).

The Pleo program can be compiled with:

`cd examples/phonotaxis_03`

`sh ../build.sh phonotaxis_03`


Running
-------
To run on a Pleo:
1. copy all of the contents of `examples/phonotaxis_03/build/` to the root directory of an SD Card.
2. Insert SD card in Pleo.
3. Turn Pleo on.


![Pleos hording](pleo_hord.jpg "Pleo hord")



