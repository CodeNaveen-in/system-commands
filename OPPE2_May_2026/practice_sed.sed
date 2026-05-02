# Q1. Print only error logs
#/ERROR/p

# Q2. Replace all WARN with Fatal
#s/WARN/FATAL/p

# Q3. Delete all info
#/INFO/!d
#p

# Q4. Replace Date with Today and remove time
#s/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}/Today/
#s/[0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\} // 
#p

# Q5. Print IP Address
#s/.*IP=\([0-9.]*\).*/IP of the system is : \1/p

# Q6. Change AUTH to Authentication in year 2026
#/^\[2025/d
#s/AUTH/Authentication/p

# Q7. Remove the second section from time.
#s/\(:[0-9][0-9]\):[0-9][0-9]/\1/p