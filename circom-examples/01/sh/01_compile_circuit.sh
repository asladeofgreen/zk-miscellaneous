_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_ROOT="$( cd "$( dirname "$_ROOT" )" && pwd )"

_DEST=$_ROOT/circuit/constraints
mkdir -p $_DEST

circom \
	$_ROOT/circuit/defn/mul2.circom --r1cs --sym --wasm --c -o $_DEST
