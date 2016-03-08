// looping a sound file backwards 08-03-2016
SndBuf mySound => Pan2 pan => dac;

//get filepath and file
me.dir()+"/audio/hihat.wav" => mySound.read;

//get number of samples
mySound.samples() => int numSamples;

//loop forward then backward
while (true) {
    
    //play forward
    0 => mySound.pos;
    numSamples :: samp => now;
    
    //and backward
    numSamples => mySound.pos;
    -1.0 => mySound.rate;
    numSamples :: samp => now;
}