/* multiple oscillators 01/03/2016 */

SinOsc s => dac;
SinOsc s2 => dac;

//set freq and gain
220 => s.freq;
1030 => s.freq;
0.5 => s.gain;
0.5 => s2.gain;

second=> now;