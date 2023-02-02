#######################################
# Runs a trusted setup simulation.
# Arguments:
#   Output destination.
#   An elliptic curve identifier supported by snarkjs for running a trusted powers of tau setup.
#   The ceremony's exponent. 
#   
#######################################
function main()
{
	local DEST=${1}
    local PTAU_CURVE=${2}
    local PTAU_POWERS=${3}

	# Reset previous.
	mkdir -p $DEST/out/ptau
	rm -rf $DEST/out/ptau/*.ptau

	# Trusted setup: Phase 1: Begin.
	snarkjs powersoftau new "$PTAU_CURVE" "$PTAU_POWERS" \
		$DEST/out/ptau/pot"$PTAU_POWERS"_0000.ptau -v

	# Trusted setup: Phase 1: Entropy Contributor 1 of N (i.e. 2).
	snarkjs powersoftau contribute \
		$DEST/out/ptau/pot"$PTAU_POWERS"_0000.ptau \
		$DEST/out/ptau/pot"$PTAU_POWERS"_0001.ptau \
		-v

	# Trusted setup: Phase 1: Entropy Contributor 1 of N (i.e. 2).
	snarkjs powersoftau contribute \
		$DEST/out/ptau/pot"$PTAU_POWERS"_0000.ptau \
		$DEST/out/ptau/pot"$PTAU_POWERS"_0001.ptau \
		-v

	# Trusted setup: Phase 2: Begin.
	snarkjs powersoftau prepare phase2 \
		"$DEST"/out/ptau/pot"$PTAU_POWERS"_0001.ptau \
		"$DEST"/out/ptau/pot"$PTAU_POWERS"_final.ptau \
		-v
}

# ----------------------------------------------------------------
# ENTRY POINT
# ----------------------------------------------------------------

# Defaults.
_DEFAULT_DEST="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_DEFAULT_DEST="$( cd "$( dirname "$_DEFAULT_DEST" )" && pwd )"
_DEFAULT_PTAU_CURVE=bn128
_DEFAULT_PTAU_POWERS=12

# Args.
unset DEST
unset PTAU_CURVE
unset PTAU_POWERS

for ARGUMENT in "$@"
do
    KEY=$(echo "$ARGUMENT" | cut -f1 -d=)
    VALUE=$(echo "$ARGUMENT" | cut -f2 -d=)
    case "$KEY" in
        dest) DEST=${VALUE} ;;
        curve) PTAU_CURVE=${VALUE} ;;
        powers) PTAU_POWERS=${VALUE} ;;
        *)
    esac
done

# Main.
main \
	"${DEST:-"$_DEFAULT_DEST"}" \
	"${PTAU_CURVE:-"$_DEFAULT_PTAU_CURVE"}" \
	"${PTAU_POWERS:-"$_DEFAULT_PTAU_POWERS"}"
