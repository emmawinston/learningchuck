// functions to compute gain and frequency - 15-03-2016

SinOsc s => dac;

//function to halve gain
fun float halfGain( float originalGain )
{
    return (originalGain * 0.5);
}

<<< "Full Gain", s.gain() >>>;
second => now;

halfGain(s.gain()) => s.gain;
<<< "Gain is now half", s.gain() >>>;
second => now;