# My Pokemon Go Research Stack Project
from tkinter import *
import tkinter.font as font
from turtle import bgcolor

# GUI PROGRAM FUNCTIONS
def read(): 
    try:
        with open("stash.txt", "r") as s:
            stash = s.readlines()
            for i in range(len(stash)):
                stash[i] = stash[i].strip("\n")
        return stash
    except FileNotFoundError:
        with open("stash.txt", "w") as s:
            pass

def update():
    stash = read()
    caughtButton.config(state=active(stash))
    caughtLabel.config(text="Current 'Mon: " + topStack(stash))
    upNextLabel.config(text="Up Next: " + nextStack(stash))
    countLabel.config(text="# in stack: " + pokeCount(stash))
    listButton.config(state=("active" if read() else "disabled"))

def active(stash):
    if stash:
        return "active"
    else:
        return "disabled"

def caught():
    try:
        stash = read()
        stash.pop(0)
    except IndexError:
        print("error")

    with open("stash.txt", "w") as s:
        for i in range(len(stash)):
            s.write(stash[i] + "\n") 
    update()

def add(p):
    stash = read()
    if len(stash) < 100:
        with open("stash.txt", "a") as s:
            s.write(p + "\n")

def topStack(stash):
    if stash:
        return stash[0]
    else:
        return "None"

def nextStack(stash):
    try:
        return stash[1]
    except:
        pass
    return "None"

def addPoke():
    p = inp.get().capitalize()
    if p:
        add(p)
        inp.delete(0, END)
        update()

def pokeCount(stash):
    if stash: 
        numPokes = len(stash)
        if numPokes >= 100:
            c = Toplevel(window)
            c.iconbitmap("pokestack.ico")
            l = Label(c, text="Careful! You're going to start to lose pokemon if you continue stacking!")
            l.pack()
            b = Button(c, text="I know. Return to Main Screen", command=c.destroy)
            b.pack()
            return "100"
        return str(numPokes)
    else: 
        return "0"

def stashContents():
    stash = read()
    if stash:
        contents = Toplevel(window)
        contents.geometry("400x350")
        contents.resizable(0, 0)
        contents.iconbitmap("pokestack.ico")

        s = Frame(contents)
        s.pack()
        sb = Scrollbar(s)
        sb.pack(side=RIGHT, fill=Y)

        pokeList = Listbox(s, width=20, font=catchFont, yscrollcommand=sb.set, justify=CENTER)
        pokeList.pack(side=BOTTOM, pady=15)
        
        sb.config(command=pokeList.yview)

        for i in range(len(stash)):
            pokeList.insert(END, str(i + 1) + " " + stash[i])
        
        e = Frame(contents)
        e.pack()
        exit = Button(e, text="Return to Main Screen", command=contents.destroy)
        exit.pack()


# INITIALIZING THE RESEARCH STACK
global stash
stash = read()

# TKINTER WIDGETS
# MAIN WINDOW
window = Tk(className="PokeStack")
h, w = 500, 400
window.geometry(str(h) + "x" + str(w))
window.resizable(0, 0)

# ICON
window.iconbitmap("pokestack.ico")

# BACKGROUND PICTURE
photo = PhotoImage(file="background.png")
myCanvas = Canvas(window, height=h, width=w)
myCanvas.pack(fill="both", expand=True)
myCanvas.create_image(0, 0, image=photo, anchor="nw")

# DEFINE FONT
buttonFont = font.Font(family="Calibri", size=14)
catchFont = font.Font(family="Calibri", size=16)
upNextFont = buttonFont

# STACK COUNTER
count = Frame(myCanvas)
count.pack(anchor="center", padx=10, pady=10)
countLabel = Label(count, text="# in stack: " + pokeCount(stash), font=buttonFont)
countLabel.pack(side=LEFT)

# CATCH FROM TOP OF STACK FRAME & WIDGETS
catch = Frame(myCanvas)
catch.pack(anchor="center", padx=20, pady=20)
caughtLabel = Label(catch, text="Current 'Mon: " + topStack(stash), font=catchFont, bd=1, justify="left")
caughtLabel.pack(side=LEFT)
caughtButton = Button(catch, text="Caught", state=active(stash), command=caught, padx=10, pady=10, font=buttonFont)
caughtButton.pack(side=RIGHT)

# NEXT UP IN STACK FRAME & WIDGETS
upNext = Frame(myCanvas)
upNext.pack(anchor="center", padx=20, pady=20)
upNextLabel = Label(upNext, text="Up Next: " + nextStack(stash), font=upNextFont, bd=1, relief="sunken")
upNextLabel.pack()

# LISTBOX
list = Frame(myCanvas)
list.pack(anchor="center", padx=10, pady=10)
listButton = Button(list, text="View Entire Stack", padx=5, pady=5, command=stashContents, state=("active" if read() else "disabled"))
listButton.pack()

# ADDING TO STACK FRAME & WIDGETS
addF = Frame(myCanvas)
addF.pack(anchor="center", padx=20, pady=20)
inp = Entry(addF, width=40)
addButton = Button(addF, text="Add to Stack", padx=5, pady=5, command=addPoke)
addButton.pack(side=BOTTOM)
inp.pack(side=LEFT)

# EXIT BUTTON
exit = Button(myCanvas, text="Exit", command=window.quit)
exit.pack()

# MAIN PROGRAM LOOP
window.mainloop()