#!/bin/bash


awk -F',' '$4 != 0' heart.csv > cleaned_heart.csv

awk -F',' '$5 != 0' heart.csv > cleaned_heart.csv
