/* Sine Music */

SinOsc s => dac;

//Play a note 
220 => s.freq;
1.0 => s.gain;
0.3::second => now;
0.0 => s.gain;
0.3::second => now;

//Second note, same pitch
1.0 => s.gain;
0.3::second => now;
0.0 => s.gain;
0.3::second => now;

//Two quieter and higher notes
330 => s.freq;
0.3 => s.gain;
0.3::second => now;

0.0 => s.gain;
0.3::second => now;

0.3 => s.gain;
0.3::second => now;

0.0 => s.gain;
0.3::second => now;

370 => s.freq;
0.3 => s.gain;
0.3::second => now;

0 => s.gain;
0.3::second => now;

0.3 => s.gain;
0.3::second => now;

0 => s.gain;
0.3::second => now;

330 => s.freq;
0.3 => s.gain;
0.6::second => now;