#!/bin/bash

mkdir courses && cd courses

courses=(maths science english)

for course in "${courses[@]}"; do
  mkdir -p "$course/assignment"
  mkdir -p "$course/exams"

  touch "$course/notes.txt"
  touch "$course/assignment/assignment1.txt"
  touch "$course/assignment/assignment2.txt"
  touch "$course/exams/midterm.txt"
done
