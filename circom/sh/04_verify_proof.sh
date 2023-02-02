_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_ROOT="$( cd "$( dirname "$_ROOT" )" && pwd )"

snarkjs groth16 verify \
	$_ROOT/main/mul2_verification_key.json \
	$_ROOT/main/example_output.json \
	$_ROOT/main/example_proof.json
