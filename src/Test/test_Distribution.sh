#!/bin/bash

## @file test_Distribution.sh

# Source the distribution script
. ../Distribution/Run.sh

failed=0

# Check if the output variables are set
if [[ -z "$TCLI_LINUX_BASH_DISTRIBUTION_ID" ]]; then
    echo "Test failed: Get distribution ID."
    ((failed++))
    else
    echo "Passed: Get distribution ID."
fi

if [[ -z "$TCLI_LINUX_BASH_DISTRIBUTION_RELEASE" ]]; then
    echo "Test failed: Get distribution release."
    ((failed++))
    else
    echo "Passed: Get distribution release."
fi

if [[ -z "$TCLI_LINUX_BASH_DISTRIBUTION_ARCH" ]]; then
    echo "Test failed: Get distribution architecture."
    ((failed++))
else
    echo "Passed: Get distribution architecture."
fi

if [[ "$failed" != 0 ]]; then
    echo "$failed tests failed."
    exit 1
fi
echo "All tests passed!"