#!/bin/bash

set -euo pipefail




# Count how many successful SSH logins versus failed attempts

numberOfSuccessfulSsh=$(awk '{print $6}' "$1" | grep "Accepted" | wc -l)
numberOfUnsuccessfulSsh=$(awk '{print $6}' "$1" | grep "Failed" | wc -l)

echo "Number of successful SSH: $numberOfSuccessfulSsh"
echo "Number of unsuccessful SSH: $numberOfUnsuccessfulSsh"