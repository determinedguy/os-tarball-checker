# os-tarball-checker

A simple script written to check weekly grades in Operating System course.

> Copyright (C) 2021 Muhammad Athallah, Fawzan Fawzi

## How to use

1. Clone this repository inside your VM
    ```
    git clone https://github.com/determinedguy/os-tarball-checker
    ```
2. cd into the folder and run `grade.sh` with your github username as the following:
    ```
    cd os-tarball-checker
    ./grade.sh -n [Your Github Username]
    ```
3. Enter the week that you want to check (for example week 6. The input should be either "6" or "06").
4. Voila! Your grade will be printed out alongside with the benchmark for that week.
5. To update your grade for the upcoming weeks, append `-r` to the options.
    ```
    ./grade.sh -n [Your Github Username] -r
    ```

## All available options

| OPTIONS: | DESCRIPTION: |
|:---------|:-------------|
| -n       | Specify the Github user (Default: determinedguy)                                   |
| -l       | Specify the extracted grade location (Default: ~/tarball-grade)                    |
| -o       | Output grade to file. Optional (Usage: -o /path/to/file)                           |
| -w       | The desired week to be checked. Optional (will ask if you don't add this option)   |
| -r       | Redownload tarballs for updating your grades for all weeks                         |
| -h       | Show this help                                                                     |

## License

The `grade.sh` script has the license of [AGPL-3.0 License](LICENSE).
