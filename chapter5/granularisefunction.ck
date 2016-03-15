// Granularise audio blender for SndBuf 15-03-2016
SndBuf2 click => dac;

//read sound file
me.dir() + "audio/stereo_fx_01.wav" => click.read;

//function to chop up any sound file
fun void granularise(SndBuf myWav, int steps)
{
    myWav.samples()/steps => int grain;
    //set play pointer to random grain location in buffer
    Math.random2(0,myWav.samples() - grain) + grain => myWav.pos;
    grain :: samp => now;
}

//main program
while (true) 
{
    //call function, time passes there?
    granularise(click,70);
}