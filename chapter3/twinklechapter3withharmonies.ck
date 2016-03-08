// Song with melody, harmony and lyrics 08-03-2016
SinOsc s => Pan2 mpan => dac;
TriOsc t => dac;

//Gain variables
0.5 => float onGain;
0.0 => float offGain;

//melody
[57,57,64,64,66,66,64,
62,62,61,61,59,59,57] @=> int melody[];

//harmony
[61,61,57,61,62,62,61,
59,56,57,52,52,68,69] @=> int harmony[];

//durations
0.5::second => dur q;
1.0::second => dur h;
[q,q,q,q,q,q,h,q,q,q,q,q,q,h] @=> dur myDurs[];

//words
["twin","kle","twin","kle","lit","tle","star",
"how","I","won","der","what","you","are"] @=> string words[];

//iterate through arrays
for (0 => int i; i < melody.cap(); i++) {
    //print out words
    <<< i, melody[i], harmony[i], words[i] >>>;
    
    //set frequencies
    Std.mtof(melody[i]) => s.freq;
    Std.mtof(harmony[i]) => t.freq;
    
    //random pan on melody
    Math.random2f(-1.0,1.0) => mpan.pan;
    
    //set gains
    onGain => s.gain;
    onGain => t.gain;
    
    //set durations
    0.7*myDurs[i] => now;
    
    //off gains
    offGain => s.gain => t.gain;
    0.3*myDurs[i] => now;
}