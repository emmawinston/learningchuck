//Controlling when drums play with hihats - chapter 4 project 08-03-2016
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
[0,1,0,0,1,0,0,0,1,1,0,0,1,0,1,0] @=> int hatHits[];

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
        if (hatHits[beat]) {
            0 => hihat.pos;
        }
        tempo => now;
        beat++;
    }
}