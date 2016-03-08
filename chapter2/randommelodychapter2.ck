// Random music with two voices and panning - 07-03-2016
/* random music generator with oscillator playing up and down 
randomly and accompaniment playing its notes an 8ve lower */

// declare melody and harmony oscillators
SinOsc s => Pan2 mpan => dac;
TriOsc t => dac;

// to separate notes later
0.5 => t.gain;
0.5 => float onGain;
0.0 => float offGain; // to control sine note gains

72 => int melodyNote; //variable to control melody

Math.srandom(230);

while (true) {
    //set melody pitch randomly with limits
    Math.random2(-3, 3) +=> melodyNote;
    
    if (melodyNote < 60) {
        60 => melodyNote; //lower limit on melodyNote;
    }
    
    if (melodyNote > 84) {
        84 => melodyNote; //upper limit on melodyNote;
    }
    
    Std.mtof(melodyNote) => s.freq; //midi to hz to s
    
    //melody has random pan for each note
    Math.random2f(-1.0, 1.0) => mpan.pan;
    
    //on dice roll change harmony note
    if (Math.random2(1, 6) == 1) {
        Std.mtof(melodyNote - 12) => t.freq; //set triosc to 8ve below sinosc
    }
    
    //Pick one of three random durations
    Math.random2(1,3)*0.2 => float myDur;
    
    //note on time is 80% of duration
    onGain => s.gain;
    (myDur*0.8) :: second => now;
    
    //space between notes is 20% of duration
    offGain => s.gain;
    (myDur*0.2) :: second => now;
}
