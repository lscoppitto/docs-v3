# CSV

### class `CSVReader`
```python
CSVReader(f, newline="\n", delimiter=",", quotechar="\"", has_header=False, comment="#", max_line=1024, as_dict=False))
```
Creates a CSV reader object with the specified format.

* `f` is the csv path or its file descriptor. The object will automatically handle both type of inputs. If `f` passed is the path string, the file will be automatically opened.

* `newline` is the string used as newline by the reader. Default is `"\n"`;

* `delimiter` is the char used as delimiter by the reader. Default is `","`;

* `quotechar` is the char used as quote identifier by the reader. Default is `"\""`;

* `has_header` if set to `True` the reader will expect a header on top of the csv. Default is `False`;

* `comment` is the char used as comment identifier by the reader. Default is `"#"`;

* `max_line` is the maximum number of lines that the reader will read. Default is `1024`;

* `as_dict` is set to true if the reader will return a data as dictionary. Default is `False`;

The `CSVReader` objects are iterable.

### method `nrow`
```python
nrow()
```
Returns the number of row the reader is currently reading.

### method `read`
```python
read()
```
Reads the content of the csv. The returned formats depends on how the reader is configured. If `as_dict` is `False`, the reader will return a list.


### method `close`
```python
close()
```
Closes the csv file.

### class `CSVWriter`
```python
CSVWriter(f, newline="\n", delimiter=',', as_dict=False)
```
Creates a CSV writer object with the specified format.

* `f` is the csv path or its file descriptor. The object will automatically handle both type of inputs. If `f` passed is the path string, the file will be automatically opened.

* `newline` is the string used as newline by the writer. Default is `"\n"`;

* `delimiter` is the char used as delimiter by the writer. Default is `","`;

* `as_dict` is set to true if the writer will user a dictionary as data. Default is `False`;

### method `close`
```python
close()
```
Closes the csv file.

### method `write_header`
```python
write_header(header)
```
Writes the header of the csv file.

* `header` is the header list to write.

### method `write`
```python
write(row, as_row=False)
```
Writes a row on the csv.

* `row` is the row to write. Depending on `as_dict` this might be a list or a dictionary.

* `as_row` if set to `True` the writer will ignore the header lenght (if present) and write all the row nevertheless.