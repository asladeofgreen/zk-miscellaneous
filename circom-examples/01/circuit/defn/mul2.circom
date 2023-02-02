	pragma circom 2.0.0;

	template Multiplier2() {
		// Input set.
		signal input a;
		signal input b;

		// Output set.
		signal output c;

		// Constraint set.
		c <== a*b;
	}

	component main = Multiplier2();
	