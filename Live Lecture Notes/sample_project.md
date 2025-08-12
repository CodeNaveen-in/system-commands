# 🛠️ 10 Mini Projects (Week-wise)

**1. Filesystem Navigator Bot**  
*Week 1 – Basic commands & filesystem navigation*  
- Create a bash script that mimics a guided tour of a VM filesystem.  
- It should navigate to specific folders, list contents, check permissions, and create symbolic and hard links.  
- Include alias creation and system info logging.

**2. Editor Showdown Challenge**  
*Week 2 – Command line editors*  
- Create a script that opens a template file in vim, emacs, or nano based on user input.  
- The user edits a question, saves it, and the script checks if the file was modified and sets executable permissions.

**3. Command Pipeline Builder**  
*Week 3 – Command chaining, redirection, pipes*  
- Build a script that takes a directory and outputs a report of all `.txt` files:  
  - Count lines, words, and characters.  
  - Redirect errors to a log file.  
  - Use pipes and tee to display and save output simultaneously.

**4. Regex Puzzle Solver**  
*Week 4 – Regex, grep, cut, paste, tr*  
- Create a script that takes a mixed-format log file and extracts:  
  - Email addresses, dates, and error codes using regex.  
  - Fold long lines, merge fields, and translate symbols.  
  - Output a cleaned CSV file.

**5. Shell Variable Transformer**  
*Week 5 – Shell variables and manipulation*  
- Write a script that takes a string and performs:  
  - Substring extraction, case transformation, pattern removal.  
  - Use default values and calculate string length.  
  - Output a summary of all transformations.

**6. File Archiver & Searcher**  
*Week 6 – find, tar, gzip, disk usage*  
- Create a script that:  
  - Finds all `.log` files older than 7 days.  
  - Archives them using tar and gzip.  
  - Displays disk usage before and after.  
  - Logs all actions.

**7. Shell Script Toolkit**  
*Week 7 – Scripting fundamentals*  
- Build a utility script that:  
  - Accepts arguments via getopts.  
  - Performs arithmetic operations.  
  - Uses loops, conditionals, and functions.  
  - Includes heredoc and debugging options.

**8. Sed Stream Cleaner**  
*Week 8 – sed scripting*  
- Create a sed script that:  
  - Deletes blank lines, replaces dates with a standard format, and appends a footer.  
  - Uses address ranges and multi-command blocks.  
  - Includes inline and external sed script versions.

**9. AWK Data Analyzer**  
*Week 9 – AWK scripting*  
- Write an AWK script that:  
  - Processes a CSV file with sales data.  
  - Calculates totals, averages, and formats output.  
  - Uses arrays, conditions, and functions.  
  - Integrates with system commands (e.g., `date`, `hostname`).

**10. VM Practice Simulator**  
*All weeks – Mixed concepts*  
- Create a script that randomly selects a question type (BPT, PPA) and simulates a VM environment.  
- Includes navigation, editing, scripting, regex, sed, awk, and output validation.  
- Mimics OPPE format with 5 randomized tasks.

# 🧠 Capstone Project: “LogMaster – Full Stack Log Processor”

**Objective:**  
Build a comprehensive shell-based tool that processes system logs from start to finish.

**Features:**
- **Navigation & Setup (Week 1):** Navigate to log directories, set up aliases, check permissions.
- **Editing Interface (Week 2):** Open logs in preferred editor for manual inspection.
- **Command Chaining (Week 3):** Use pipes and redirection to extract and filter logs.
- **Regex Extraction (Week 4):** Extract timestamps, IPs, and error codes using grep and tr.
- **Variable Manipulation (Week 5):** Store extracted data in shell variables for further processing.
- **Archiving & Searching (Week 6):** Archive old logs and search for specific patterns.
- **Script Logic (Week 7):** Use loops, conditionals, and argument parsing to automate tasks.
- **Stream Editing (Week 8):** Clean logs with sed – remove noise, format entries.
- **Data Analysis (Week 9):** Use AWK to generate reports – error frequency, user activity.
- **Final Output:**  
  - Generates a summary report.  
  - Archives processed logs.  
  - Offers interactive options for future runs.

Would you like me to help scaffold any of these projects with starter code or structure?