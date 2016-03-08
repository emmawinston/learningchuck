//Using SndBuf to play a sound file 08-03-2016
SndBuf mySound => dac;

//get file path
me.dir() => string path; //gets working directory
//get file
"audio/snare.wav" => string filename;

//connect strings together
path+filename => filename;

//tellSndBuf to read file
filename => mySound.read;

//gain
0.5 => mySound.gain;

//play from beginning
0 => mySound.pos;

//advance time 
second => now;