# rM-signature-patch
Simple script to remove that pesky advert at the bottom of a mail originating from a reMarkable.

## Installation
1. SSH into your reMarkable
2. Paste the following and press enter:  
`sh -c "$(wget https://raw.githubusercontent.com/Barabazs/rM-signature-patch/main/signature-patch.sh -O-)"`
3. Test it by sending a mail to yourself.

## How it works
The script first checks if Perl is installed and will install it if necessary.  
Then it will search for a specific string in Xochitl (the rM software) and replace a part of it so it won't be included at the bottom of your emails.
And finally the script restarts Xochitl and you're done.


### Before
![Before](media/before.png)

### After  
![After](media/after.png)

## Disclaimer
* Read the license!
* Take a proper backup! 

<br>  

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/T6T51XKUJ)
