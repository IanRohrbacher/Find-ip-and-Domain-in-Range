# Scan nslookup Over Range

Small helper script to perform reverse DNS lookups (nslookup) across an IPv4 range and save any PTR results to `Results.txt`.

Quick usage

```sh
# run from a bash shell (Git Bash, WSL, macOS, Linux):
./nslookup.bash
# or
bash nslookup.bash
```

## What it does

- Iterates over an IP range defined at the top of the script (octets 1–4).
- Runs `nslookup` for each IP and writes addresses that have a DNS name to `Results.txt`.

## Configurable variables
Editable at top of `nslookup.bash`

- `octet1`, `octet2` — fixed first two octets of the range.
- `start_octet3`, `end_octet3` — range for the third octet.
- `start_octet4`, `end_octet4` — range for the fourth octet.
- `OUTPUTFILE` — output file (default `Results.txt`).

## Requirements

- `bash` (or compatible shell)
- `nslookup` (usually provided by `bind-utils` or `dnsutils`)
- `sed` (standard Unix text utility)

## Notes

- The script can take a long time for large ranges. Run it inside `screen`, `tmux`, or use `nohup`/`&` if you need it to keep running after you log out.
- On Windows use WSL, Git Bash, or MSYS2 to run the script.

## Output

- Results are appended to `Results.txt` in the same directory. The file contains IP: hostname lines and separators between third-octet blocks.



