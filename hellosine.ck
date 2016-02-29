// 29/02/16

SinOsc s => dac;
0.6 => s.gain;
220 => s.freq;
2::second => now; 