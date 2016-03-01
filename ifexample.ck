/* if statements - 01/03/2016 */

//sound chain
SinOsc s => dac;

//set freq
220.0 => s.freq;
//set vol
0.6 => s.gain;

//chance variable
1 => int chance;

if (chance == 1) {
    //sound will only play if chance is 1
    1::second => now;
}

//set new frequency
330.0 => s.freq;
1::second => now;