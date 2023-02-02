_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_ROOT="$( cd "$( dirname "$_ROOT" )" && pwd )"

# Powers of Tau parameterisations.
_PTAU_CURVE=bn128
_PTAU_POWERS=12

# Trusted setup: Phase 1: Begin.
snarkjs powersoftau new $_PTAU_CURVE $_PTAU_POWERS \
	$_ROOT/prover/pot$_PTAU_POWERS_0000.ptau -v

# Trusted setup: Phase 1: Entropy Contributor 1 of N (i.e. 2).
snarkjs powersoftau contribute \
	$_ROOT/prover/pot$_PTAU_POWERS_0000.ptau \
	$_ROOT/prover/pot$_PTAU_POWERS_0001.ptau \
	-v

# Trusted setup: Phase 1: Entropy Contributor 1 of N (i.e. 2).
snarkjs powersoftau contribute \
	$_ROOT/prover/pot$_PTAU_POWERS_0000.ptau \
	$_ROOT/prover/pot$_PTAU_POWERS_0001.ptau \
	-v
