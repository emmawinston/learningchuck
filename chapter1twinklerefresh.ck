// Twinkle from scratch with two oscillators
SinOsc s => dac;
TriOsc t => dac;

// main pitch variable
110.0 => float melody;

// main gain variable 
0.3 => float onGain;

// on and off times
0.3 :: second => dur myDur;


// play only t at first
onGain => t.gain;
0 => s.gain;

while (melody < 220.0) {
    melody => t.freq;
    1.0 +=> melody;
    0.01 :: second => now;
}

0.7 => s.gain;
110 => s.freq;

// play first twinkle on triangle oscillator
for (0 => int i; i < 2; i++) {
    onGain => t.gain;
    myDur => now;
    0 => t.gain;
    myDur => now;
}

// set pitches for second twinkle
138.6 => s.freq;
1.5*melody => t.freq;

// play second twinkle on triangle oscillator
for (0 => int i; i < 2; i++) {
    onGain => t.gain;
    myDur => now;
    0 => t.gain;
    myDur => now;
}

//set pitches for little 
146.8 => s.freq;
1.6837*melody => t.freq;

// play little on triangle oscillator
for (0 => int i; i < 2; i++) {
    onGain => t.gain;
    myDur => now;
    0 => t.gain;
    myDur => now;
}

// set pitch for star
138.6 => float secondpitch;
1.5*melody => t.freq;

secondpitch => s.freq;


//play star
onGain => t.gain;
second => now;

while (melody > 0 && secondpitch > 0) {
    1.5*melody => t.freq;
    secondpitch => s.freq;
    1.0 -=> melody;
    1.0 -=> secondpitch;
    0.01 :: second => now;
}