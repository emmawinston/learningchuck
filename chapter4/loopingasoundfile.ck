// looping a sound file 08-03-2016
SndBuf mySound => Pan2 pan => dac;

//get file path
me.dir()+"audio/snare-chili.wav" => mySound.read;

//play in loop
while(true) {
    //random gain, rate and pan each time
    Math.random2f(0.1,1.0) => mySound.gain;
    Math.random2f(-1.0,1.0) => pan.pan;
    Math.random2f(0.2, 1.8) => mySound.rate;
    
    //restart by setting position to 0
    0 => mySound.pos;
    
    //advance time
    500.0:: ms => now;
}