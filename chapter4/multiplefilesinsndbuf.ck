// managing multiple samples 08-03-2016
SndBuf snare => dac;

//make and fill an array of filepaths and names
string snare_samples[3];
me.dir()+"/audio/snare.wav" => snare_samples[0];
me.dir()+"/audio/snare-chili.wav" => snare_samples[1];
me.dir()+"/audio/snare-hop.wav" => snare_samples[2];

//loop
while (true) {
    // pick a random number between 0 and the total
    Math.random2(0,snare_samples.cap()-1) => int which;
    
    //load file
    snare_samples[which] => snare.read;
    
    //play
    0.5::second => now;
}