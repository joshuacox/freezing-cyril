#!/bin/bash
# set cpu gov
# in a 8 core cpu environment
for i in {0..7}; do echo "sudo cpufreq-set -c$i -g $1";done
for i in {0..7}; do sudo cpufreq-set -c$i -g $1;done
cpufreq-info

