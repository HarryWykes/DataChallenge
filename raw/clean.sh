#!/bin/bash

awk -F',' '$5 != 0' heart.csv > cleaned_heart.csv
