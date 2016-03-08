//stereo sound files 08-03-2016

SndBuf2 mySound => dac;

//load file
me.dir()+"/audio/stereo_fx_01.wav" => mySound.read;

//let it play
mySound.length() => now;