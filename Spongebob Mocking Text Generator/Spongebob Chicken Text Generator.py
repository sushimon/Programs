# This program will return a string of text in mocking text format (alternating between upper and lowercase)
text = input("Enter text: ").lower()
count = 0
out = ""

# iterate through the string
for letter in text:
    # get the ASCII number of the current letter
    letterAsInt = ord(letter)
    # check if it is a letter of the alphabet
    if letterAsInt <= 122 and letterAsInt >= 97:
        # add it to the output string but change it to uppercase if the counter is even 
        # helps ignore punctuation, numbers, etc. when creating the mocking text
        if count % 2 == 0:
            out += letter.upper()
        else:
            out += letter
        count += 1
    else:
        out += letter

print(out)