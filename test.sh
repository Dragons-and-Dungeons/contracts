#!/usr/bin/env bash

export DAPP_BUILD_OPTIMIZE=1
export DAPP_BUILD_OPTIMIZE_RUNS=1000000
export DAPP_LINK_TEST_LIBRARIES=0
export DAPP_TEST_SMTTIMEOUT=500000
export DAPP_TEST_VERBOSITY=3
export DEEP_FUZZ="false"

if [ "$DEEP_FUZZ" == "true" ]
then
  export PROPTEST_CASES=50000 # Fuzz for a long time if DEEP_FUZZ is set to true.
else
  export PROPTEST_CASES=100 # Only fuzz briefly if DEEP_FUZZ is not set to true.
fi

## --match-contract ContractName
forge test -vv --match-contract Character
