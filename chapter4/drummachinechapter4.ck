// drum machine chapter 4 project 08-03-2016
SndBuf kick => Gain master => dac;
SndBuf snare => master; //connecting to master means dac automatic

//load up samples
me.dir()+"/audio/kick_01.wav" => kick.read;
me.dir()+"/audio/snare_01.wav" => snare.read;

0 => snare.pos;
0.6::second => now;

while (true) {
    //Beat 1, play kick drum solo
    <<< "playing kick solo" >>>;
    0 => kick.pos;
    0.6::second => now;
    
    //beat 2, play snare with kick
    <<< "playing both" >>>;
    0 => kick.pos;
    0 => snare.pos;
    0.6::second => now;   
}

// for some reason this plays both samples first and I don't know why
