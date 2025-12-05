# OPPE Problem 1
## Problem Statement

A data scientist wishes to train image classification models based on 5 different datasets. These are named from `DatasetA` to `DatasetE`. There are three categories of image files within each dataset, namely `train`, `test` and `validation`. Before downloading the images, the directory structure needs to be created.

Write a bash script to create the directories for the datasets. Within each dataset directory, create subdirectories for `train`, `test`, and `validation`. In each subdirectory, create two empty files named `metadata.yml` and `README.md`.

The directory structure should be the following after running the script.
 ```bash
  12   │ .
  13   │ ├── DatasetA
  14   │ │   ├── test
  15   │ │   │   ├── README.md
  16   │ │   │   └── metadata.yml
  17   │ │   ├── train
  18   │ │   │   ├── README.md
  19   │ │   │   └── metadata.yml
  20   │ │   └── validation
  21   │ │       ├── README.md
  22   │ │       └── metadata.yml
  23   │ ├── DatasetB
  24   │ │   ├── test
  25   │ │   │   ├── README.md
  26   │ │   │   └── metadata.yml
  27   │ │   ├── train
  28   │ │   │   ├── README.md
  29   │ │   │   └── metadata.yml
  30   │ │   └── validation
  31   │ │       ├── README.md
  32   │ │       └── metadata.yml
  33   │ ├── DatasetC
  34   │ | # ...
  ```
  
## Instructions
- Your script should be named `datasets.sh`.
- It should be present in `~/se2001/nppe_1/`.
- It should create the files `metadata.yml` and `README.md` as described in the problem statement.
- The files should be empty.
- It should not output anything to the console.
- If you want to print something for debugging purposes, write to a file or to the standard error stream.

# Answer : 

```bash
#!/bin/bash
# datasets.sh
# Script to create dataset directories with train, test, validation subdirectories
# Each subdirectory contains empty metadata.yml and README.md files

# Base directory
BASE_DIR=~/se2001/nppe_1

# Dataset names
DATASETS=("DatasetA" "DatasetB" "DatasetC" "DatasetD" "DatasetE")

# Subdirectories
SUBDIRS=("train" "test" "validation")

# Create structure
mkdir -p "$BASE_DIR"
cd "$BASE_DIR" || exit 1

for dataset in "${DATASETS[@]}"; do
    for subdir in "${SUBDIRS[@]}"; do
        mkdir -p "$dataset/$subdir"
        touch "$dataset/$subdir/metadata.yml" "$dataset/$subdir/README.md"
    done
done
```