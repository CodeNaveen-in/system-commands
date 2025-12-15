# Remove all DEBUG lines
/DEBUG/d

# Replace "ERROR" with "CRITICAL ERROR"
s/ERROR/CRITICAL ERROR/

# Remove timestamps (everything inside [ ])
s/\[[^]]*\] //

# Convert "INFO:" to "INFORMATION:"
s/INFO:/INFORMATION:/

# Convert "WARN:" to "WARNING:"
s/WARN:/WARNING:/