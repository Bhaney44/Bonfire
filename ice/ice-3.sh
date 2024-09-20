label4:

# This sets up the subroutine to expect one argument (and no return value). 
# The argument to the application call is the ASA ID that the Bonfire app needs to opt into
# That arg is passed into this subroutine here and will be fetched shortly
proto 1 0

# This instruction begins an inner transaction.
itxn_begin

# Set the innerTxn type to 4, which means asset transfer
pushint 4
itxn_field TypeEnum

# Set the innerTxn receive to this application's address
global CurrentApplicationAddress
itxn_field AssetReceiver

# "Dig" into the frame, which in this case has one argument as indicated in proto 1 0 above
# This sets the innerTxn's transfer asset to the ASA ID that was passed in as an argument above
frame_dig -1
itxn_field XferAsset

# Set the innerTxn amount to zero
intc_0
itxn_field AssetAmount

# Set the InnerTxn fee to zero
intc_0
itxn_field Fee

# Send the inner transaction. 
# Note that the innerTxn built above is a send-to-self with zero quantity, which effectively opts this application into the given ASA ID
itxn_submit

retsub
