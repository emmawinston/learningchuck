//Controlling when drums play - chapter 4 project 08-03-2016
SndBuf kick => Gain master => dac;
SndBuf snare => master;
SndBuf hihat => master;

me.dir()+"/audio/kick_01.wav" => kick.read;
me.dir()+"/audio/snare_01.wav" => snare.read;
me.dir()+"/audio/hihat_01.wav" => hihat.read;

0.3 => hihat.gain;

0.15::second => dur tempo;

//arrays to tell drums when to play
[1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0] @=> int kickHits[];
[0,0,1,0,0,0,1,0,0,0,0,0,1,1,1,1] @=> int snareHits[];

while (true) {
    0 => int beat;
    
    while (beat < kickHits.cap()) {
        // play kick based on array value
        if (kickHits[beat]) {
            0 => kick.pos;
        }
        if (snareHits[beat]) {
            0 => snare.pos;
        }
        1 => hihat.pos;
        tempo => now;
        beat++;
}
}