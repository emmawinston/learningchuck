// drum machine with logic chapter 4 project 08-03-2016
SndBuf kick => Gain master => dac;
SndBuf snare => master; //connecting to master means dac automatic

//load up samples
me.dir()+"/audio/kick_01.wav" => kick.read;
me.dir()+"/audio/snare_01.wav" => snare.read;

// declare new tempo variable
0.15::second => dur tempo;

0 => snare.pos;
0.6::second => now;

while (true) {
    
    for (0 => int beat; beat < 16; beat++) {
    //play kick on 0, 4, 8, 12
    if (beat==0 || beat==4 || beat==8 || beat==12) {
        0 => kick.pos;
    }
    //play snare on beat 4, 10, 13, 14
    if (beat==4||beat==10||beat==13||beat==14) {
        0 => snare.pos;
    }
    tempo => now;
}
}