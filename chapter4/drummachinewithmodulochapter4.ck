// drum machine with modulo operator 08-03-2016
SndBuf clickhi => dac;
SndBuf clicklo => dac;
me.dir()+"audio/click_02.wav" => clickhi.read;
me.dir()+"audio/click_01.wav" => clicklo.read;

//define a number for modulo
4 => int MOD;

for (0 => int beat; beat < 24; beat++) {
    //print beat and beat modulo MOD
    <<< beat, "Modulo ", MOD, "is: ", beat % MOD >>>;
    
    //hi sound on every beat
    0 => clickhi.pos;
    
    //but only low sound every MODth beat
    if (beat % MOD == 0) {
        0 => clicklo.pos;
    } 
  0.5::second => now;
}