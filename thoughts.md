#**keep in mind**
* From Cyrus: "We hope that this exercise will allow us to evaluate your skills as a developer. The qualities that we pay special attention to are:
    * Simplicity/elegance of design
    * Adherence to good software engineering principles
    * Maintainability (clean, easy to understand code)
    * Effective use of the standard library
    * Use of unit tests"
* Single-responsibility principle!
* Separation of concerns!
    * raw data
        * read
        * parse
        * transform, make uniform
    * parsed data
        * order by different attributes
        * output (same each time)

#the given files
* comma-delimited
    * last, first, gender, color, m/dd/yyyy
* pipe-delimited
    * last | first | m | g | color | m-d-yyyy
* space-delimited
    * last first m g m-d-yyyy color

#strategy for getting the records
* CSV lib

#got the data, now what?
* some options for proceeding:
    * store temporarily as hash (least overhead, but volatile)
    * persist records as csv/text file (stable, easy to share, environment-agnostic)

#in between
* Custom Record objects?
* Hashes?

#CSV
* write each record to a new file, starting at end
    * `file = File.new("filename.txt", 'a+')`
        * mode options:
            * `'r'`: read only, file exists
            * `'w'`: write only, new file
            * `'a'`: append write, creates if doesn't exist
            * `'r+'`: read + write
            * `'w+'`: empty file for read + write
            * `'a+'`: read + append, creates if doesn't exist
    * `file.puts #{record_string}`
    * don't forget `file.close` with `File.new`!
