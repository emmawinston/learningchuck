//stereo sound files with gain on each channel 08-03-2016

//declare and load stereo file
SndBuf2 mySound;
me.dir()+"/audio/stereo_fx_03.wav" => mySound.read;

//for stereo panning
Gain bal[2];

//connect channels to bal up in stereo
mySound.chan(0) => bal[0] => dac.left;
mySound.chan(1) => bal[1] => dac.right;
//set to repeat forever
1 => mySound.loop;

//set up stereo panning
while (true) {
    //pick random playback rate and random panning
    Math.random2f(0.2,1.8) => mySound.rate;
    Math.random2f(-1.0,1.0) => float balance;
    
    //turn balance into left/right gain
    (balance+1)/2.0 => float rightGain;
    1.0 - rightGain => float leftGain;
    leftGain => bal[0].gain;
    rightGain => bal[1].gain;
    
    0.3 :: second => now;
}