# os-tarball-checker

> **LAST REVISION**: `REV05 Sun 21 Nov 2021 19:00:00 WIB`

A simple script written to check weekly grades in Operating System course.

> Copyright (C) 2021 Muhammad Athallah, Fawzan Fawzi

## How To Use

1. Clone this repository inside your VM.
    ```
    git clone https://github.com/determinedguy/os-tarball-checker
    ```
2. cd into `os-tarball-checker` and run `tarball-checker.sh` with the following command:
    ```
    ./tarball-checker.sh
    ```
3. Enter the week that you want to check (for example week 6. The input should be either `6` or `06`).
4. Voila! Your grade will be printed out alongside with the _benchmark_ for that week.
5. To update your grade for the upcoming weeks, append `-r` to the options.
    ```
    ./tarball-checker.sh -r
    ```
 
## All Available Options

| OPTIONS: | DESCRIPTION: |
|:---------|:-------------|
| -o       | Output the grade for the week to file. Optional (Usage: -o /path/to/file)          |
| -w       | The desired week to be checked. Optional (will ask if you don't add this option)   |
| -r       | Redownload tarballs for updating your grades for all weeks                         |
| -h       | Show this help                                                                     |

## Changelog

### REV05
- Changed everything in the README to English.
- Simplified how to use section.
- Added some options.
- Added measure to make sure the user doesn't redownload the tarball everytime they want to check a different week or in case when gpg fails to decrypt the user's tarball. This can be ignored with `-r` option.

### REV04
- Automatically set the username (with `$USER`).

### REV03
- Renamed script to `tarball-checker.sh`.
- Changed target directory to `/tmp/tarball-checker` so that the script doesn't add more junks to the user's home dir and increase the flexibility of the script (can be put in any folder. It doesn't have to be in `~/tarball-grade`).
- Changed the input username into an interactive input (not _hard-coded_).

### REV02
- Changed the input for the desired week into an interactive input (not _hard-coded_).

## License

The `tarball-checker.sh` script has the license of [AGPL-3.0 License](LICENSE).
