// using array data to play a melody 08-03-2016
SqrOsc s => dac;

// gains to separate notes
0.7 => float onGain;
0.0 => float offGain;

//declare and initialise array
[57, 57, 64, 64, 66, 66, 64, 62, 62, 61, 61, 59, 59, 57] @=> int a[];

//loop for length of array
for (0 => int i; i < a.cap(); i++) {
    <<< i, a[i] >>>;

//set frequency and gain to turn on note
Std.mtof(a[i]) => s.freq;
onGain => s.gain;
0.3::second => now;

//turn off note to separate from next
offGain => s.gain;
0.2::second => now;
}