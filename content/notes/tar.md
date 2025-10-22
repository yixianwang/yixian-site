+++
title = 'Tar'
date = 2025-10-21T22:58:48-04:00
+++

# The `tar` command — a practical, modern guide

Below is a tight-but-complete playbook you can actually use. Copy/paste the recipes; tweak paths as needed.

---

## 0) What `tar` is

* **tar** = “tape archive”: it groups files/dirs into a single stream (“archive”).
* It can **also** compress by delegating to gzip/bzip2/xz/zstd/etc.
* Common archive suffixes: `.tar` (no compression), `.tar.gz`/`.tgz`, `.tar.bz2`, `.tar.xz`, `.tar.zst`, `.tar.lz4`.

---

## 1) The 5 core verbs

* **c** = create
* **x** = extract
* **t** = list (table of contents)
* **r** = append (to end; works only for uncompressed `.tar`)
* **u** = update (append newer versions; also for plain `.tar`)

Always pair with **f** to name the archive file.

**Patterns**

```bash
# Create
tar -cf archive.tar DIR ...
tar -czf archive.tar.gz DIR ...       # gzip
tar -cJf archive.tar.xz DIR ...       # xz
tar -cjf archive.tar.bz2 DIR ...      # bzip2
tar --zstd -cf archive.tar.zst DIR ...# zstd (GNU tar)
tar --lz4  -cf archive.tar.lz4 DIR ...# lz4  (GNU tar)

# List
tar -tf archive.tar[.gz|.xz|...]      # see contents

# Extract
tar -xf archive.tar[.gz|.xz|...]
tar -xf archive.tar -C /target/dir    # extract somewhere else

# One file / subset
tar -xf archive.tar path/inside/file
tar -xf archive.tar --strip-components=1 path/top/dir/
```

> Tip: Use **`-v`** (verbose) to see file names. Use **`-C DIR`** to change into a dir before acting.

---

## 2) Compression options (when creating)

* `-z` = gzip (fast, common)
* `-j` = bzip2 (slower, better than gzip)
* `-J` = xz (slowest, best ratio)
* `--zstd` = Zstandard (great ratio **and** speed; needs GNU tar)
* `--lz4` = LZ4 (very fast, lower ratio; GNU tar)
* `-a` = **auto**: pick compressor from extension (GNU tar)

Examples:

```bash
# Auto-compress by extension (GNU tar)
tar -caf backup.tar.zst /data

# Fast, good default (zstd)
tar --zstd -cf site.tar.zst /var/www
```

---

## 3) Must-know safety habits

* **Peek before extracting**: `tar -tf archive.tar.gz | less`
* **Don’t overwrite existing files**: `tar -xkf archive.tar.gz` (keep old files) or `--skip-old-files`
* **Avoid absolute paths in archives** (they can write to `/`). If you must extract them, you’d need `-P/--absolute-names`—avoid unless you trust the archive.
* **Choose the target dir** with `-C` and/or strip leading folders:

  ```bash
  tar -xf thing.tar.gz -C /opt/app --strip-components=1
  ```

---

## 4) Excluding things

```bash
tar -czf src.tar.gz src/ --exclude-vcs \
  --exclude='node_modules' --exclude='*.log'

# From a file
tar -czf home.tar.gz /home/user --exclude-from=exclude.txt
# exclude.txt lines: 
# .cache
# **/*.tmp
# Downloads/large/*
```

> On GNU tar, globs in `--exclude` are handled by tar; if you pass globs as positional paths, **quote them** so the shell doesn’t expand first.

---

## 5) Preserve ownership, permissions, metadata

* **When creating**: tar stores mode/uid/gid/mtime by default.
* **When extracting**:

  * As **root**, use `--same-owner` to preserve owners; as non-root, owners map to your uid.
  * `-p/--preserve-permissions` to keep file modes.
  * For extended metadata:

    * `--xattrs` (Linux extended attributes)
    * `--acls` (POSIX ACLs)
    * `--selinux` (SELinux contexts)

Example:

```bash
sudo tar -xpf backup.tar --xattrs --acls --selinux -C /
```

---

## 6) Verify and compare

```bash
# Compare archive vs filesystem
tar -df archive.tar[.gz|...]          # reports differences

# Or verify integrity of the file you created
tar -tf archive.tar.gz > /dev/null    # lists everything; nonzero exit on error
# For compressed archives, add a checksum file after creation:
sha256sum archive.tar.zst > archive.tar.zst.sha256
sha256sum -c archive.tar.zst.sha256
```

---

## 7) Incremental and differential backups (GNU tar)

* Keep a **snapshot file** that records state between runs.

```bash
# Full
tar --listed-incremental=snap.snar -cpf full.tar /home

# Next runs (incremental)
tar --listed-incremental=snap.snar -cpf inc-2025-10-21.tar /home
```

* Restoring: extract the **full** first, then incrementals **in order**.
* To create a fresh full backup next time, remove/rotate the `.snar`.

> If you just want a “changed since last full” without `.snar`, consider using `rsync` or `--newer-mtime='2025-10-01'` for date-based selection.

---

## 8) Streaming & remote copies (no temp files)

```bash
# Push to remote over SSH
tar -C /data -czf - . | ssh host 'tar -xzf - -C /srv/backup'

# Pull from remote
ssh host 'tar -C /srv/logs -czf - .' | tar -xzf - -C ./logs

# Stream to/from cloud tools that read stdin/stdout similarly
```

---

## 9) Split large archives & reassemble

```bash
# Create and split into 2 GiB parts
tar -czf - bigdir/ | split -b 2000m - bigdir.tar.gz.part-

# Reassemble and extract
cat bigdir.tar.gz.part-* | tar -xzf -
```

---

## 10) Sparse files, devices, FIFOs

* **Sparse files** (disk images, databases): `--sparse` on create & extract to save space.
* **Special files** (device nodes, FIFOs, sockets): tar can store them; to restore properly you usually need root, and often `--same-owner -p`.

```bash
tar -c --sparse -f images.tar /var/lib/libvirt/images
```

---

## 11) Path rewrites and layout control

```bash
# Pack contents of ./build into archive root (no leading 'build/')
tar -C build -czf app.tar.gz .

# Strip first N leading components when extracting
tar -xzf app.tar.gz --strip-components=1 -C /opt/app

# Rename paths on the fly (GNU tar)
tar -czf src-renamed.tar.gz src/ --transform='s,^src/,project-src/,'
```

---

## 12) Selecting by time or size

```bash
# Only files newer than a date
tar -czf recent.tar.gz /data --newer-mtime='2025-10-01'

# Only files under a size (use find + tar)
find /logs -type f -size -50M -print0 | tar --null -T - -czf small-logs.tar.gz
```

---

## 13) Show progress

```bash
# Rough progress (file count)
tar -czf backup.tar.gz /home \
  --checkpoint=.500 --totals

# With pv (pipe viewer) for byte-level progress
tar -cf - /home | pv | gzip > home.tar.gz
```

---

## 14) Extract to stdout (for one-off inspection)

```bash
# Print a file from inside the archive
tar -xOf archive.tar.gz path/inside/file.txt | less

# Save a single file
tar -xzf archive.tar.gz path/inside/file.txt -O > file.txt
```

---

## 15) Appending & updating (plain .tar only)

```bash
tar -rf archive.tar newfile
tar -uf archive.tar maybe/updated/dir
```

> Not supported for compressed archives; recreate instead (or use `--append --file=-` tricks with compressors, but it’s messy—prefer a new archive).

---

## 16) Reproducible (deterministic) archives

Make byte-identical archives across machines/runs:

```bash
tar -cf app.tar src \
  --sort=name \
  --mtime='UTC 2020-01-01' \
  --owner=0 --group=0 --numeric-owner
gzip -n app.tar   # gzip without timestamps
```

---

## 17) Platform notes

* **Linux** (GNU tar): supports `--zstd`, `--lz4`, `--transform`, `-a`, incremental `--listed-incremental`, rich metadata flags.
* **macOS** default `tar` = **bsdtar** (libarchive). Most flags are similar; some long options differ. For full GNU features (`--zstd`, certain transforms), install **gnu-tar** via Homebrew (`brew install gnu-tar`, command is `gtar`).
* **Windows**: in Git Bash or WSL, use GNU tar. On vanilla PowerShell, prefer WSL or 3rd-party ports.

---

## 18) Quick cheat sheet (copy me)

```bash
# Create (auto-compress by extension, GNU tar)
tar -caf backup.tar.zst DIR/

# Safe extract: inspect first, then extract to a clean dir
tar -tf backup.tar.zst | less
mkdir restore && tar -xaf backup.tar.zst -C restore

# Exclude stuff
tar -caf src.tar.xz src/ --exclude-vcs --exclude='node_modules' --exclude='*.log'

# Extract subset + strip leading folder
tar -xaf pkg.tar.gz --strip-components=1 -C /opt/pkg path/top/dir/

# Remote copy over SSH
tar -C /data -caf - . | ssh host 'tar -xaf - -C /srv/backup'

# Incremental (GNU)
tar --listed-incremental=state.snar -cpf full.tar /home
tar --listed-incremental=state.snar -cpf inc1.tar /home

# Progress
tar -caf backup.tar.zst /home --checkpoint=.1000 --totals

# Verify
tar -df backup.tar.zst
```

---

If you tell me your OS (Linux/macOS) and which compressor you prefer (gzip/zstd/xz), I can tailor a few one-liners and a tiny `backup.sh` for your exact setup.
