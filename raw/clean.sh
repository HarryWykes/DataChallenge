#!/bin/bash


awk -F',' '$4 && $5 != 0' heart.csv > cleaned_heart.csv
