# Trying to Function

## Gist

Use at your own risk.  These are functions that at some point or another are useful to me.

## Basic Usage

Load the functions by using either a dot `.` or the `source` command.  More info on [bash's source command here](https://www.tldp.org/LDP/abs/html/internal.html#SOURCEREF)

```
username@host:~$ source bashfunctions.sh
```

![image](https://user-images.githubusercontent.com/7351154/72717244-82f44a80-3b28-11ea-89b1-67337dda7203.png)

### Date Time Functions

The date command can be used with +%s (`date +%s` to get [Epoch Time](https://en.wikipedia.org/wiki/Unix_time)

The seconds since the epoch can then be given to the `epochconvert` function:

    username@host:~$ epochconvert 1579514915

![image](https://user-images.githubusercontent.com/7351154/72717168-66f0a900-3b28-11ea-9079-2b1650011bd8.png)


### Color Info 

Get the color codes for your terminal.....Handy for using color in commands or changing PS1

![image](https://user-images.githubusercontent.com/7351154/72717382-c2bb3200-3b28-11ea-8dee-d736c37de196.png)


## TODO 

- [ ] Write More Todos!
- [ ] Setup POSIX functions
- [ ] Add some Unit tests (using python)
- [ ] Add some CI 
