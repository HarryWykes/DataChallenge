#!/bin/bash

awk -F',' '$4 && $5 != 0' heart.csv > /../clean/cleaned_heart.csv

Rscript Heart_challenge.R

