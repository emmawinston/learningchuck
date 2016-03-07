// set up oscillator
SinOsc t => dac;
1.0 => t.gain;

// for loop
/* for (0 => int i; i < 127; i++) {
    Std.mtof(i) => float hz;
    <<< i, hz >>>;
    hz => t.freq;
    0.5 :: second => now;
} */

// while loop
int i;
while (i < 127) {
    Std.mtof(i) => float hz;
    <<< i, hz >>>;
    hz => t.freq;
    0.5 :: second => now;
    i++;
}