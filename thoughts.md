#**keep in mind**
* "We hope that this exercise will allow us to evaluate your skills as a developer. The qualities that we pay special attention to are:
    * Simplicity/elegance of design
    * Adherence to good software engineering principles
    * Maintainability (clean, easy to understand code)
    * Effective use of the standard library
    * Use of unit tests"

#the given files
* comma-separated
    * last, first, gender, color, m/dd/yyyy
* pipe
    * last | first | m | g | color | m-d-yyyy
* space
    * last first m g m-d-yyyy color

#strategy for getting the records
* script must read each file for data:
    * `file = File.open("filename.txt", "r")`
    * grab each line and put it into some ruby data structure array
    * replace '|' & ',' characters with single whitespace
        * without removing '-' separating dates
        * `gsub(/[^\w|-]/, " ")`
    * then replace '-' with '/'
        * `gsub([-], "/")`
    * then remove middle initial
        * `split(" ")` to create array of line data
        * check if array length is 6 to avoid deleting gender
        * `data.delete_at(2) if data.length == 6`
* at this point, all data is uniformly formatted, but the colors are in the wrong place for data from two of the three sources

#got the data, now what?
* some options for proceeding:
    * store temporarily as hash (least overhead, but volatile)
    * persist records as csv/text file (stable, easy to share, environment-agnostic)
    * persist records to db (stable, lots of config req'd, most powerful for sorting and reorganizing)

#in between
* OBJECTS?
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
