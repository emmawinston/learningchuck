// noise oscillator and panning 07-03-2016
// sound chain: white noise to pan2 to dac
Noise n => Pan2 p => dac;

// set noise at lowish volume
0.2 => n.gain;

//infinite loop
while (true) {
    //oscillate pan between 1.0 and -1.0 in sine pattern
    Math.sin(now/second) => p.pan;
    // quite fast to make it smooth
    ms => now;
}