sudo aptitude install gtkvncviewer

# Run the following command to fix one error
# ref. http://ubuntuforums.org/showthread.php?t=1467361&p=10272223#post10272223
#### Error message and stacktrace
#Gkr-Message: secret service operation failed: Cannot get secret of a locked object
#Traceback (most recent call last):
#  File "./gtkvncviewer.py", line 426, in <module>
#    instance = GtkVncViewer()
#  File "./gtkvncviewer.py", line 129, in __init__
#    secret = gnomekeyring.item_get_info_sync(keyring, auth_token).get_secret()
#gnomekeyring.IOError
#### Error message and stacktrace end
sudo sed -i -e '130 s/gnomekeyring.DeniedError/(gnomekeyring.DeniedError, gnomekeyring.BadArgumentsError,gnomekeyring.IOError)/' /usr/share/gtkvncviewer/gtkvncviewer.py
