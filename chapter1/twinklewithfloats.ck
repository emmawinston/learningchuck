/* Twinkle Music with floats 29/02/2016 */

SinOsc s => dac;

//initialise twinkle pitch
220.0 => float twinkle;

//multiply twinkle for little
1.6818 * twinkle => float little;

//volume
0 => int off;
1 => int on;

//Play note 1
twinkle => s.freq;
on => s.gain;
0.3::second => now;
off => s.gain;
0.3::second => now;

//Play note 2
on => s.gain;
0.3::second => now;
off => s.gain;
0.3::second => now;

//modify twinkle pitch
1.5 *=> twinkle;

//play second twinkle
twinkle => s.freq;
on => s.gain;
0.3::second => now; 
off => s.gain;
0.3::second => now;
on => s.gain;
0.3::second => now; 
off => s.gain;
0.3::second => now;

//play little
little => s.freq;
on => s.gain;
0.3::second => now;
off => s.gain;
0.3::second => now;
on => s.gain;
0.3::second => now;
off => s.gain;
0.3::second => now;

//play star
twinkle => s.freq;
on => s.gain;
0.6::second => now;