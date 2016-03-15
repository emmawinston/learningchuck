// swell function, operates on any type of UGen 15-03-2016

fun void swell(UGen osc, float begin, float end, float step)
{
    float val;
    // swell up volume
    for(begin => val; val < end; step +=> val)
    {
        val => osc.gain;
        0.01::second => now;
    }
    // swell down volume
    while (val > begin)
    {
        val => osc.gain;
        step -=> val;
        0.01::second => now;
    }
}

//main program
//sound patch
TriOsc tri => dac;

//array of notes to play
[60,62,63,65,63,64,65,58,57,56] @=> int notes[];

//swell through all notes
for (0 => int i; i < notes.cap(); i++)
{
    Std.mtof(notes[i]) => tri.freq;
    //call swell function
    swell(tri,0.2,1.0,0.01);
}