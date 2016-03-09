//ultimate drum machine without code copying 08-03-2016

//set up gain 
Gain master[3] => dac;
master[0] => dac.left;
master[1] => dac;
master[2] => dac.right;

//set up samples
SndBuf kick => master;
SndBuf snare => master;
SndBuf hihat => master;
SndBuf cowbell => master;
SndBuf clap => Pan2 cPan;

cPan.chan(0) => master[0];
cPan.chan(1) => master[2]; //I think this makes sense

//load up samples
me.dir()+"/audio/kick_01.wav" => kick.read;
me.dir()+"/audio/snare_01.wav" => snare.read;
me.dir()+"/audio/hihat_01.wav" => hihat.read;
me.dir()+"/audio/cowbell_01.wav" => cowbell.read;
me.dir()+"/audio/clap_01.wav" => clap.read;

[0,0,1,1, 0,1,0,1, 0,1,1,0, 1,0,1,1] @=> int cowHits[];

cowHits.cap() => int MAX_BEAT;
4 => int MOD;

//counters, one for beat, one for measure
0 => int beat;
0 => int measure;

//tempo 
0.15::second => dur tempo;

//drum loop
while (true) {
    //play kick drum on all main beats
    if (beat % MOD == 0) {
        0 => kick.pos;
    }
    //play snare on off beats
    if (beat % MOD == 2 && measure > 0) {
        0 => snare.pos;
    }
    
    if (measure > 1) {
    if (cowHits[beat]) {
        0 => cowbell.pos;
    }
    else {
        Math.random2f(0.0, 1.0) => hihat.gain;
        0 => hihat.pos;
    }
    
    if (measure > 2) {
        Math.random2f(-1.0,1.0) => cPan.pan;
        0 => clap.pos;
    }
}   

        
    tempo => now;
    (beat+1) % MAX_BEAT => beat; //bit I don't understand but seems crucial!
    <<< "beat: ", beat, " measure: ", measure >>>;
    
    if (beat == 0)
    {
        measure++;
    }  

}