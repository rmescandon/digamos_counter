# DIGAMOS counter

A counter of words DIGAMOS detected through microphone

## Install on Ubuntu 18:04

This tool has solely been tested on this OS and version.

Clone the repository

```sh
git clone https://github.com/rmescandon/digamos_counter.git
cd digamos_counter
```

Install by executing the included script
```sh
./install.sh
```

## Execute

Launch the tool:

```sh
./run.sh
```

and start to say

```
Digamoooss....
Digamooooooooss...
...

```

## Alternative execution

If tool is enough trained, you can pass *man* or *woman* cli param as the training to use.
If no one is passed as parameter, man is taken (heteropatriarcality).

```sh
./run.sh man
```

```sh
./runs.h woman
```