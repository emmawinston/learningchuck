//Storing durations in an array 08-03-2016

SqrOsc s => dac;
0.7 => float onGain;
0.0 => float offGain;

[57,57,64,64,66,66,64,62,62,61,61,59,59,57] @=> int myNotes[];

0.3 :: second => dur q;
0.8 :: second => dur h;

[q,q,q,q,q,q,h,q,q,q,q,q,q,h] @=> dur myDurs[];

for (0 => int i; i < myNotes.cap(); i++) {
    Std.mtof(myNotes[i]) => s.freq;
    onGain => s.gain;
    myDurs[i] => now;
    
    //turn off
    offGain => s.gain;
    0.2::second => now;
    
}