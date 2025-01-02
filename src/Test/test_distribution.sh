# test_distribution.sh

#!/bin/bash

# Run the distribution script
. ../Distribution/distribution.sh

# Check if the output variables are set
if [[ -z "$TCLI_LINUX_DISTRIBUTION_ID" ]]; then
    echo "Test failed: Distribution ID is not set."
    exit 1
fi

if [[ -z "$TCLI_LINUX_DISTRIBUTION_RELEASE" ]]; then
    echo "Test failed: Distribution release is not set."
    exit 1
fi

if [[ -z "$TCLI_LINUX_DISTRIBUTION_ARCH" ]]; then
    echo "Test failed: Distribution architecture is not set."
    exit 1
fi

echo "All tests passed!"