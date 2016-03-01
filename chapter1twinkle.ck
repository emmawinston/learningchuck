/* Twinkle little star example with two oscillators 01/03/2016 */

//declare oscillators
SinOsc s => dac;
TriOsc t => dac;

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

//play two notes on triangle oscillator, first twinkle
for (0 => int i; i < 2; i++) {
    ongain => t.gain;
    mydur => now;
    0 => t.gain;
    mydur => now;
}

//change pitches for second twinkle
138.6 => s.freq;
1.5*melody => t.freq;

//two notes on triangle oscillator, second twinkle
for (0 => int i; i < 2; i++) {
    ongain => t.gain;
    mydur => now;
    0 => t.gain;
    mydur => now;
} 

//change pitches for little
146.8 => s.freq;
1.6837 * melody => t.freq;

//play notes for little
for (0 => int i; i < 2; i++) {
    ongain => t.gain;
    mydur => now;
    0 => t.gain;
    mydur => now;
}

//change pitches for star
138.6 => s.freq;
1.5*melody => t.freq;

//play note for star
ongain => t.gain;
second => now;

while (melody > 0) {
    1.5*melody => t.freq;
    //lower pitch
    1.0 -=> melody;
    //increment time
    0.01::second => now;
}