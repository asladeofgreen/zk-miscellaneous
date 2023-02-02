_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_ROOT="$( cd "$( dirname "$_ROOT" )" && pwd )"

# Powers of Tau parameterisations.
_PTAU_POWERS=12

# Trusted setup: Phase 2: Begin.
snarkjs powersoftau prepare phase2 \
	$_ROOT/prover/pot12_0001.ptau \
	$_ROOT/prover/pot12_final.ptau \
	-v

# Trusted setup: Phase 2: Setup.
snarkjs groth16 setup \
	$_ROOT/circuit/constraints/mul2.r1cs \
	$_ROOT/prover/pot12_final.ptau \
	$_ROOT/main/mul2_0000.zkey

# Trusted setup: Phase 2: Entropy Contributor 1 of N (i.e. 2).
snarkjs zkey contribute \
	$_ROOT/main/mul2_0000.zkey \
	$_ROOT/main/mul2_0001.zkey \
	--name="Mark A. Greenslade" \
	-v

# Trusted setup: phase 2: Entropy Contributor 1 of N (i.e. 2).
snarkjs zkey contribute \
	$_ROOT/main/mul2_0001.zkey \
	$_ROOT/main/mul2_0002.zkey \
	--name="Mark A. Greenslade" \
	-v

# Trusted setup: phase 2: Emit verification key.
snarkjs zkey export verificationkey \
	$_ROOT/main/mul2_0002.zkey \
	$_ROOT/main/mul2_verification_key.json
