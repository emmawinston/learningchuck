/* Twinkle little star example with two oscillators 01/03/2016 */

//declare oscillators
SinOsc s => dac;
TriOsc s2 => dac;

//main pitch variable
110.0 => float melody;

//gain control for triangle wave
0.3 => float ongain;

//on and off times 
0.3::second => dur mydur;


//only play triangle sweeping pitch upward
ongain => t.gain;
//turn on sine oscillator
0 => s.gain;

//play melody on triangle oscillator
while (melody < 220.0) {
    melody => t.freq;
    //raise pitch
    1.0 +=> melody;
    //increment time
    0.01::second => now;
}

//set pitch and gain of sine oscillator
0.7 => s.gain;
110 => s.freq;

