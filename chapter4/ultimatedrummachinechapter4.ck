// ultimate drum machine 08-03-2016

// define gains for left, center, right
Gain master[3];
master[0] => dac.left;
master[1] => dac;
master[2] => dac.right;

//declare sndbufs for all drums
SndBuf kick => master[1];
SndBuf snare => master[1];
SndBuf hihat =>master[2];
SndBuf cowbell => master[0];

//use Pan2 for handclaps
SndBuf clap => Pan2 claPan;
claPan.chan(0) => master[0];
claPan.chan(1) => master[2];

//load up samples
me.dir()+"/audio/kick_01.wav" => kick.read;
me.dir()+"/audio/snare_01.wav" => snare.read;
me.dir()+"/audio/hihat_01.wav" => hihat.read;
me.dir()+"/audio/cowbell_01.wav" => cowbell.read;
me.dir()+"/audio/clap_01.wav" => clap.read;

//array for cowbell strikes
[1,0,1,0, 1,0,0,1, 0,1,0,1, 0,1,1,1] @=> int cowHits[];

//controls length of measures
cowHits.cap() => int MAX_BEAT;

//modulo for controlling kick and snare
4 => int MOD;

//overall speed control
0.15::second => dur tempo;

//counters, one for beat, one for measure
0 => int beat;
0 => int measure;


//main infinite drum loop
while(true) {
    
    //play kick drum on all main beats
    if (beat % MOD == 0) {
        0 => kick.pos;
    }
    //play snare on off beats
    if (beat % MOD == 2 && measure%2 ==1) {
        0 => snare.pos;
    }
    
    //randomly play hihat or cowbell
    if (measure > 1) {
        if (cowHits[beat]) {
            0 => cowbell.pos;
        }
        
        else //if not cowbell then hihat
        {
            Math.random2f(0.0,1.0) => hihat.gain;
            0 => hihat.pos;
        }
    }
        //play randomly spaced claps at end of measure
        if (beat > 11 && measure > 3) {
            Math.random2f(-1.0,1.0) => claPan.pan;
            0 => clap.pos;
        }
        
        tempo => now;
        (beat + 1) % MAX_BEAT => beat; 
        <<< "beat: ", beat, " measure: ", measure >>>;
       
        if (beat == 0)
            {
                measure++;
            }  
 }