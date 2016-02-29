/* random triangle wave music 20/02/2016 */

TriOsc t => dac;

//infinite loop runs forever
while (true) {
    //randomly choose freq from 30 to 1000
    Math.random2(30,1000) => t.freq;
    
    //randomly choose duration from 30 to 1000ms
    Math.random2f(30,1000) ::ms => now;
}