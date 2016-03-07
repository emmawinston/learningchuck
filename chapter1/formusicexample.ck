/* musical use of for loop 01/03/2016 */
SinOsc s => dac;

//loop
for (20 => int i; i < 1000; i++)
{
    <<< i >>>; //print value
    i => s.freq; //set freq to i
    10::ms => now; //advance time
}

for (1000 => int i; i > 20; i--) {
     <<< i >>>; //print value
    i => s.freq; //set freq to i
    10::ms => now; //advance time
}