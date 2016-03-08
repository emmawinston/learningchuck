// more efficient method with multiple SndBufs 08-03-2016
SndBuf snare[3];

//pan to left, right and centre
snare[0] => dac.left;
snare[1] => dac;
snare[2] => dac.right;

//preload sound files
me.dir()+"/audio/snare.wav" => snare[0].read;
me.dir()+"/audio/snare-chili.wav" => snare[1].read;
me.dir()+"/audio/snare-hop.wav" => snare[2].read;

//loop
while(true) {
    //pick a random number
    Math.random2(0, snare.cap()-1) => int which;
    
    //play sample
    0 => snare[which].pos;
    
    //let it play
    0.5::second => now;
}