# Github Actions Reference

https://docs.github.com/en/actions/reference

# Bash Functional Utilities Cheatsheet

---

## 1. Text Processing / Mapping

| Tool    | What it does                  | Example                     |                      |
| ------- | ----------------------------- | --------------------------- | -------------------- |
| `awk`   | Pattern scanning & processing | `echo -e "1\n2\n3"          | awk '{print $1*2}'`  |
| `sed`   | Stream editor                 | `echo "foo"                 | sed 's/o/O/g'`→`fOO` |
| `tr`    | Translate / delete characters | `echo "a b c"               | tr ' ' '\n'`         |
| `cut`   | Extract fields                | `echo "a:b:c"               | cut -d':' -f2`→`b`   |
| `paste` | Join lines                    | `paste -sd ',' -` → `a,b,c` |                      |

---

## 2. Filtering / Selecting

| Tool      | What it does                  | Example                               |                   |
| --------- | ----------------------------- | ------------------------------------- | ----------------- |
| `grep`    | Search / filter lines         | `echo -e "a\nb\nc"                    | grep "b"`→`b`     |
| `awk`     | Conditional filter            | `echo -e "1\n2\n3"                    | awk '$1>1'`→`2 3` |
| `sed`     | Delete lines matching pattern | `sed '/b/d'` → remove lines with `b`  |                   |
| `comm`    | Compare sorted files          | `comm -12 file1 file2` → common lines |                   |
| `sort -u` | Unique / sort                 | `echo -e "a\na\nb"                    | sort -u`→`a b`    |

---

## 3. Reducing / Aggregating

| Tool    | What it does                   | Example            |                                         |
| ------- | ------------------------------ | ------------------ | --------------------------------------- |
| `awk`   | Sum, min, max, average         | `echo -e "1\n2\n3" | awk '{s+=$1} END{print s}'` → 6         |
| `paste` | Column-wise sum                | `paste -sd+ -      | bc` → sum numbers in a line             |
| `bc`    | Arbitrary precision calculator | `echo "1+2*3"      | bc` → 7                                 |
| `xargs` | Combine / execute              | `echo 1 2 3        | xargs -n1 echo` → prints each on a line |

---

## 4. Iterating / Loops

| Technique               | Example                                 |                                       |
| ----------------------- | --------------------------------------- | ------------------------------------- |
| `for i in $(seq 1 5)`   | `for i in $(seq 1 5); do echo $i; done` |                                       |
| `while read`            | `cat file                               | while read line; do echo $line; done` |
| `mapfile` / `readarray` | `mapfile -t arr < file`                 |                                       |

---

## 5. Array / Functional Tricks

**Map:**

```bash
arr=(1 2 3)
map=("${arr[@]/%/_x}")  # adds _x to each element
```

**Filter:**

```bash
arr=(1 2 3 4)
filtered=()
for i in "${arr[@]}"; do
  (( i % 2 == 0 )) && filtered+=("$i")
done
```

**Reduce / Sum:**

```bash
arr=(1 2 3 4)
sum=0
for i in "${arr[@]}"; do
  ((sum+=i))
done
s/echo $sum  # 10
```

---

## 6. Other Useful Utilities

* `head`, `tail` → first/last lines
* `wc -l` → count lines
* `uniq` → remove duplicates (after sorting usually)
* `xargs` → transform input into command arguments
* `tee` → duplicate output to file and stdout
* `expr` → integer arithmetic
* `seq` → generate number sequences
* `yes` → repeat a string indefinitely (for testing)

## Self-signed certificates
```bash
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes \
    -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=localhost"

# change CN to desired host
```


---

# 7. Process management

- `ps aux` - List processes
- Running a command with & will make it run in background
  eg: `sleep 100 &`
- `pstree -p` shows a cool tree view of all processes
- `jobs -l` - List all the jobs started by the current session
- `top` - Real-time interactive process monitoring
- `kill <PID>` - Gracefully terminate process |
- `kill -9 <PID>` - Forcefully terminate process (SIGKILL) |
- `pkill <process_name>` - Kill processes by name |
- `killall <process_name>` - Kill all processes with a specific name |

# Bash Parameter Expansion Cheatsheet

## Basic
- `${var}` — value of variable
- `${#var}` — length of variable (in characters)

## Substrings
- `${var:offset}` — substring from offset
- `${var:offset:length}` — substring of given length

## Pattern Removal (globs, not regex)
- `${var#pattern}` — remove shortest match of pattern from start
- `${var##pattern}` — remove longest match of pattern from start
- `${var%pattern}` — remove shortest match of pattern from end
- `${var%%pattern}` — remove longest match of pattern from end

## Pattern Replacement
- `${var/pat/repl}` — replace first match of pat with repl
- `${var//pat/repl}` — replace all matches
- `${var/#pat/repl}` — replace pat at start
- `${var/%pat/repl}` — replace pat at end

## Default / Assign / Test
- `${var:-word}` — use word if var is unset or null
- `${var-word}` — use word if var is unset
- `${var:=word}` — assign word if var is unset or null
- `${var=word}` — assign word if var is unset
- `${var:+word}` — use word if var is set and non-null
- `${var+word}` — use word if var is set
- `${var:?msg}` — error with msg if var is unset or null
- `${var?msg}` — error with msg if var is unset

## Case Modification (bash)
- `${var^}` — uppercase first character
- `${var^^}` — uppercase all characters
- `${var,}` — lowercase first character
- `${var,,}` — lowercase all characters

## Indirection
- `${!name}` — value of variable whose name is in name
- `${!prefix*}` — variable names starting with prefix
- `${!prefix@}` — variable names starting with prefix

## Arrays
- `${arr[@]}` — all elements
- `${arr[*]}` — all elements (word-split difference)
- `${#arr[@]}` — number of elements
- `${arr[@]:offset:length}` — subarray slice
- `${!arr[@]}` — array indices

## Misc
- `${var^^pattern}` — uppercase only chars matching pattern
- `${var,,pattern}` — lowercase only chars matching pattern

# Kubernetes references

https://kubernetes.io/docs/reference/kubectl
https://kubernetes.io/docs/reference/kubectl/generated/kubectl/
https://minikube.sigs.k8s.io/docs/commands/service/
