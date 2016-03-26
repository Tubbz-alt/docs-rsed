## 
library(rsed)

## 
skylark <- c("Higher still and higher",
             "From the earth thou springest",
             "Like a cloud of fire;",
             "The blue deep thou wingest,",
             "And singing still dost soar, and soaring ever singest.")

# To view it as a stream:
as.stream(skylark)

## 
cat("Add something after this line\n",
    "Replace this line\n",
    "Delete this line\n",
    "Substitute 'this' for 'that'\n",
    "Comment this line\n",
    file = "stream.txt", sep = "")

## 
cat("Add something after this line",
    "\nReplace this line",
    "\nDelete this line",
    "\nSubstitute 'this' for 'that'",
    "\nComment this line")

## 
s <- as.stream(readLines("stream.txt"))

## 
s

## 
sed_insert(s, "Add something after this line", "Here's the addition")

## 
s

## 
sed_replace(s, "Replace this", "A replacement")

## 
s

## 
sed_replace(s, "Delete this", NULL)

## 
s

## 
sed_substitute(s, "'that'", "'this'")

## 
s

## 
sed_comment(s, "Comment", type = "html")

## 
s <- readLines("stream.txt")
s <- sed_insert(s, after = "Add something", insertion = "Here's the addition")
s <- sed_replace(s, at = 3, replacement = "A replacement")
s <- sed_replace(s, at = 4, replacement = NULL)
s <- sed_substitute(s, pattern = "'that'", replacement = "'this'")
s <- sed_comment(s, at = "Comment", type = "html")
writeLines(s, con = "newStream1.txt")

## 
streamEdit(list(i = list(after = "Add something", insertion = "Here's the addition"),
                r = list(at = 3, replacement = "A replacement"),
                r = list(at = 4, replacement = NULL),
                s = list(pattern = "'that'", replacement = "'this'"),
                c = list(at = "Comment", type = "html")),
            inFile = "stream.txt", 
            outFile = "newStream2.txt")

## 
as.stream(readLines("stream.txt"))

## 
as.stream(readLines("newStream2.txt"))

## 
# The result from calling each function individually
s1 <- readLines("newStream1.txt")

# The result from the single call to streamEdit()
s2 <- readLines("newStream2.txt")

identical(s1, s2)

## 
s <- readLines("stream.txt")
class(s)
class(as.stream(s))

## 
print(s)

## 
print(as.stream(s))

## 
sed_comment(s, 5, type = "R")
sed_comment(as.stream(s), 5, type = "R")

## 
unlink(c("stream.txt", "newStream1.txt", "newStream2.txt"))

