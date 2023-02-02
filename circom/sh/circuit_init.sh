_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_ROOT="$( cd "$( dirname "$_ROOT" )" && pwd )"

mkdir -p $_ROOT/out/circuits/bin
mkdir -p $_ROOT/out/circuits/constraints
mkdir -p $_ROOT/out/circuits/defn

circom \
	$_ROOT/circuit/defn/mul2.circom --r1cs --sym --wasm --c -o $_ROOT/circuit/constraints
