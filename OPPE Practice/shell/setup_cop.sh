#!/bin/bash

# Base directory
BASE_DIR="courses"

# Subjects
SUBJECTS=("math" "science" "english")

# Create base directory
mkdir -p "$BASE_DIR"

# Loop through subjects
for subject in "${SUBJECTS[@]}"; do
  mkdir -p "$BASE_DIR/$subject/assignments"
  mkdir -p "$BASE_DIR/$subject/exams"

  # Create files
  touch "$BASE_DIR/$subject/notes.txt"
  touch "$BASE_DIR/$subject/assignments/assignment1.txt"
  touch "$BASE_DIR/$subject/assignments/assignment2.txt"
  touch "$BASE_DIR/$subject/exams/midterm.txt"
done

echo "Course directory structure created successfully!"
