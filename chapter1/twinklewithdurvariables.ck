/* Sine music with dur variables - 29/02/2016 */

SinOsc s => dac;

220.0 => float twinkle;
0.55::second => dur ondur;
0.05::second => dur offdur;

1 => int ongain;
0 => int offgain;

//play one note
twinkle => s.freq;
ongain => s.gain;
ondur => now;

offgain => s.gain;
offdur => now;

ongain => s.gain;
ondur => now;

offgain => s.gain;
offdur => now;

//increase pitch
1.5 *=> twinkle;

//play next note
twinkle => s.freq;
ongain => s.gain;
ondur => now;

offgain => s.gain;
offdur => now;

ongain => s.gain;
ondur => now;

offgain => s.gain;
offdur => now;