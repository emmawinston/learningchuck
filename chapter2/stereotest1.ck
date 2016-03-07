// sine waves in stereo - 08-03-16
//left and right built in
SinOsc s => dac.left;
SinOsc t => dac.right;

// set freq
220 => s.freq;
361 => t.freq;

//advance time
second => now;

//multichannel 
/*
SinOsc s0 => dac.chan(0);
SinOsc s1 => dac.chan(1);
SinOsc s2 => dac.chan(2);
SinOsc s3 => dac.chan(3);
*/
