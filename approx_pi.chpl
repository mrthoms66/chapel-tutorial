use Random;

config const n = 100000; // number of random points to generate
config const seed = 314159265; // random number generator to seed

writeln("Number of points     = ", n);
writeln("Random number seed   = ", seed);

var rs = new RandomStream(seed, parSafe=true);
var lock$ : sync bool;
var count = 0;
coforall i in 1..n do
	if (rs.getNext()**2 + rs.getNext()**2 <= 1.0) {
		lock$ = true;
		count += 1;
		lock$;
	}
delete rs;

writeln("Approximation of PI = ", format("#.#######", count * 4.0 / n));
