############################################################
#pragma version 9
###########################################################
###########################################################
# Defines 2 integers 0, 1
intcblock 0 1  
# This compares the current transaction’s ApplicationID with the constant intc_0 (which is 0). 
# It will push 1 if the ApplicationID is greater than 0, otherwise 0.
# 1257620981
txn ApplicationID  
intc_0  
>  
# The result of the comparison (0 or 1) is then multiplied by 6.
# It would always result in either 0 (if ApplicationID is 0) or 6 (if ApplicationID is greater than 0).
pushint 6  
*  
# The program adds the value of txn.OnCompletion to the result of the multiplication operation.
# The OnCompletion field specifies the desired action after transaction completion (like NoOp, CloseOut, etc.). 
# Adding this to the earlier result also seems out of place since mixing arithmetic on these unrelated values doesn’t serve a clear purpose.
txn OnCompletion  
+  
# The switch statement directs execution based on the combined result of the previous operations. 
# label1: The program jumps here if the combined value matches.
# label2: corresponds to values 1 through 5 (all those values point to label2).
# label3: corresponds to the value 6.
switch label1 label2 label2 label2 label2 label2 label3  

###########################################################
###################### Label 2 ############################
###########################################################
# The execution jumps to label2 when the value in the switch statement is between 1 and 5. 
# However, label2 immediately contains an err
label2: 
err  

###########################################################
###################### Label 6 ############################
###########################################################
label6:  
# Access the second argument in ApplicationArgs
txna ApplicationArgs 1  
# Access the second argument in ApplicationArgs
btoi  
# Access the asset ID from the Assets array
txnas Assets  
# Call the subroutine at label4
callsub label4  
# Load constant 1 onto the stack
intc_1  
# Return from the program
return   

###########################################################
###################### Label 4 ############################
###########################################################
label4:  
# Subroutine takes 1 argument, returns 0
proto 1 0  
# Begin inner transaction
itxn_begin  
# Push TypeEnum for an Asset Transfer (4 represents an asset transfer)
pushint 4  
# Set TypeEnum for inner transaction (asset transfer)
itxn_field TypeEnum  
# This line retrieves the current smart contract's address
global CurrentApplicationAddress  
# Set the receiver of the transfer to the smart contract's address
itxn_field AssetReceiver
# Get the argument passed to the subroutine (asset ID)  
frame_dig -1  
# Set the asset ID for the inner transaction
itxn_field XferAsset  
# Push 0 to the stack (likely for AssetAmount)
intc_0  
# Set the amount of the asset to transfer (0 in this case)
itxn_field AssetAmount  
# Push 0 for the Fee field (indicating a fee-less transaction)
intc_0  
# Set the fee for the inner transaction to 0
itxn_field Fee  
# Submit the inner transaction
itxn_submit  
# Return from the subroutine
retsub  

###########################################################
###################### Label 5 ############################
###########################################################
label5:  
# Push constant 1 onto the stack
intc_1  
# Return from the program
return  

###########################################################
###################### Label 1 ############################
###########################################################
label1:  
# Push a specific byte sequence onto the stack
# The first byte 0xb8 is a non-printable character, which often represents binary data or is used in non-textual contexts (such as a binary identifier). 
# The rest of the string translates to D{6.
pushbytes 0xb8447b36  
# Get the first Application Argument (index 0) from the transaction and push it onto the stack
txna ApplicationArgs 0  
# Compare the two values on the stack. If they match, jump to label5
match label5  
# If they don't match, the program results in an error
err  

###########################################################
###################### Label 3 ############################
###########################################################
label3:  
# Push the byte sequence 0x44f8d5de onto the stack
# Translates partially to D followed by three non-printable characters.
pushbytes 0x44f8d5de  
# Get the first Application Argument (index 0) from the transaction
txna ApplicationArgs 0  
# Compare the two values on the stack. If they match, jump to label6
match label6  
# If they don't match, terminate the program with an error
err  