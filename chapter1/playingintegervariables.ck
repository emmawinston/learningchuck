/* Sine music with integer variables, 29/02/2016 */

SinOsc s => dac;

//initialise integer variable
220 => int mypitch;

//declare integers for gain control
1 => int on;
0 => int off;

//Play a note
mypitch => s.freq;
on => s.gain;
0.3::second => now;

off => s.gain;
0.3::second => now;

2 *=> mypitch;

//play second note with higher pitch
mypitch => s.freq;
on => s.gain;
0.3::second => now;

off => s.gain;
0.3::second => now;