# iKlem's Aegisub scripts

This repository contains LUA scripts I (iKlem) made for my friends who are using the software [Aegisub](https://github.com/Aegisub/Aegisub) for Karaokes.

If you want to contribute or update scripts you are free to open a Pull Request.

## Scripts
### lowercase_firstletter
- Author : [Clément "iKlem" DELALANDE](https://github.com/iKlem)
- Version : 0.4.1
- Aegisub version made for : 3.2.2
- Description :
  Put to lower case the first letter of lines (since there's no upper case in japanese).
  The rules are :
    - if it's followed by a lower case letter.
    - if it's followed by a space.
    - only the first letter of the line.

  I'm using two patterns for the double quotes found in some karaoke project files. If you have any optimization to make do not hesitate to make a pull request

### trim_spaces
- Author : [Clément "iKlem" DELALANDE](https://github.com/iKlem)
- Version : 0.1.0
- Aegisub version made for : 3.2.2
- Description : Trim start & trailing spaces in lines, remove spaces around all `\n` or `\N` and remove trailing `\N`. This is a custom script for a friend, it may not be useful for your project.
