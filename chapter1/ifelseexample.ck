/* if else example 01/03/2016 */
SinOsc s => dac;

//set freq
220.0 => s.freq;
//set vol
0.6 => s.gain;

//chance logical variable
1 => int chance;

if (chance == 1) {
    //play first twinkle note if chance = 1
    1::second => now;
}
else {
    //otherwise play higher note 
    330.0 => s.freq;
    //and play for longer
    3::second => now;
}

// set and play note an octave above
440.0 => s.freq;
1::second => now;