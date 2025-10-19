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

---

