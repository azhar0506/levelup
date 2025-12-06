#!/bin/bash

set -euo pipefail

# Count how many successful SSH logins versus failed attempts

awk '{print $6}' $1 == "Accepted"