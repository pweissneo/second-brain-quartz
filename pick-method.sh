#!/bin/bash
# Weighted random discovery method selector.
# Adjust probabilities here (must sum to 100):
#   REDUNDANCY_SCAN     = 50%
#   FLUFF_DETECTOR      = 12%
#   FRONTIER_EXPLORATION = 15%
#   SEED_STRESS_TEST    = 10%
#   COMPLIANCE_AUDIT    =  8%
#   STRUCTURAL_HEALTH   =  5%
r=$((RANDOM % 100))
if   [ $r -lt 50 ]; then echo "REDUNDANCY_SCAN"
elif [ $r -lt 62 ]; then echo "FLUFF_DETECTOR"
elif [ $r -lt 77 ]; then echo "FRONTIER_EXPLORATION"
elif [ $r -lt 87 ]; then echo "SEED_STRESS_TEST"
elif [ $r -lt 95 ]; then echo "COMPLIANCE_AUDIT"
else                      echo "STRUCTURAL_HEALTH"
fi
