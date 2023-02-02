_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_ROOT="$( cd "$( dirname "$_ROOT" )" && pwd )"

snarkjs groth16 prove \
	$_ROOT/main/mul2_0001.zkey \
	$_ROOT/main/witness.wtns \
	$_ROOT/main/proof.json \
	$_ROOT/main/public.json
