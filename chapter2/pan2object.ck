// Use of the pan2 object - 07-03-2016
SinOsc s => Pan2 p => dac;

//initialise pan position
-1.0 => float panPosition;

//loop to vary panning
for (0 => int i; i < 8; i++) {
    while (panPosition < 1.0) {
        panPosition => p.pan;
        <<< panPosition >>>;
        panPosition + 0.01 => panPosition;
        10 :: ms => now; 
    }
    while (panPosition > -1.0) {
        panPosition => p.pan;
        <<< panPosition >>>;
        panPosition - 0.01 => panPosition;
        10 :: ms => now; 
    }
}