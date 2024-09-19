############################################################
#pragma version 9  
############################################################
############################################################
# This block defines two integer constants (0,1)
intcblock 0 1  
# This instruction pushes the application's ID onto the stack.
# 1257620981
txn ApplicationID  
# This pushes the integer constant intc_0 (value 0) onto the stack.
# constant 0 from intcblock
intc_0  
# This instruction pops the top two values from the stack, compares them, and pushes the result (1 if the first value is greater, 0 otherwise) onto the stack.
# A greater than B => {0 or 1}
>  
# This pushes the integer value 6 onto the stack.
pushint 6  
# This instruction multiplies the top two values on the stack and pushes the result.
# Overflow is an error condition which halts execution and fails the transaction.
*  
# This instruction pushes the OnCompletion field of the current transaction onto the stack.
# The OnCompletion field indicates what **should** happen after the transaction is executed (e.g., close out, delete application, etc.).
# Update the application's parameters.
# https://developer.algorand.org/docs/get-details/dapps/smart-contracts/frontend/apps/
txn OnCompletion  
# This instruction adds the top two values on the stack and pushes the result.
# Overflow is an error condition which halts execution and fails the transaction.
+  
# This instruction initiates a switch statement with multiple labels. 
# The value on top of the stack determines which label to jump to.
# Branch to the Ath label. 
# Continue at following instruction if index A exceeds the number of labels.
switch label1 label2 label2 label2 label2 label2 label3  

###########################################################
###################### Label 2 ############################
###########################################################
# This is the default label for the switch statement, indicating an error condition.
label2:  
err  

###########################################################
###################### Label 6 ############################
###########################################################
# This label is executed if the value on top of the stack matches the byte array 0x44f8d5de.
label6:  
# This instruction pushes the second application argument onto the stack.
txna ApplicationArgs 1  
# This instruction converts the value on top of the stack into an integer.
btoi  
# This instruction pushes the assets associated with the transaction onto the stack.
txnas Assets  
# This instruction calls the subroutine labeled label4.
callsub label4  
# This instruction pushes the integer constant intc_1 onto the stack.
intc_1  
# This instruction returns from the current subroutine.
return  

###########################################################
###################### Label 4 ############################
###########################################################
# This subroutine is defined to transfer an asset.
label4:  
# This instruction sets the protocol version to 1.0.
proto 1 0  
# This instruction begins an inner transaction.
itxn_begin  
# This instruction pushes the integer 4 onto the stack.
pushint 4  
# This instruction sets the type of the inner transaction to TypeEnum.
# TypeEnum can take on several different values, each representing a distinct transaction type.
# UpdateApplicationOC = 4
# set field F of the current inner transaction to A
itxn_field TypeEnum  
# This instruction pushes the current application's address onto the stack.
# global field F
global CurrentApplicationAddress  
# This instruction sets the recipient of the asset transfer.
itxn_field AssetReceiver  
# This instruction digs one level deep into the transaction frame and pushes the value at that level onto the stack.
frame_dig -1  
#This instruction sets the asset to be transferred.
itxn_field XferAsset  
# This instruction pushes the integer constant intc_0 onto the stack.
# constant 0 from intcblock
intc_0  
# This instruction sets the amount of the asset to be transferred.
# set field F of the current inner transaction to A
itxn_field AssetAmount  
# This instruction pushes the integer constant intc_0 onto the stack.
# constant 0 from intcblock
intc_0  
# This instruction sets the fee for the inner transaction.
# set field F of the current inner transaction to A
itxn_field Fee  
# This instruction submits the inner transaction.
# execute the current inner transaction group. 
# Fail if executing this group would exceed the inner transaction limit, or if any transaction in the group fails.
# itxn_submit resets the current transaction so that it can not be resubmitted.
itxn_submit  
# This instruction returns from the subroutine.
retsub 

###########################################################
###################### Label 5 ############################
###########################################################
# This label is executed if the value on top of the stack matches the byte array 0xb8447b36.
label5:  
intc_1  
return  

###########################################################
###################### Label 1 ############################
###########################################################
label1:  
# This instruction pushes the byte array 0xb8447b36 onto the stack.
# 3,091,495,734
pushbytes 0xb8447b36  
# This instruction pushes the first application argument onto the stack.
txna ApplicationArgs 0  
# This instruction compares the value on top of the stack with the byte array 0xb8447b36 and jumps to label5 if they match.
match label5  
# This instruction indicates an error condition.
err  

###########################################################
###################### Label 3 ############################
###########################################################
# This label is executed if the value on top of the stack matches the byte array 0x44f8d5de.
label3:  
# This instruction pushes the byte array 0x44f8d5de onto the stack.
# 1,157,158,366
pushbytes 0x44f8d5de  
# This instruction pushes the first application argument onto the stack.
txna ApplicationArgs 0  
# This instruction compares the value on top of the stack with the byte array 0x44f8d5de and jumps to label6 if they match.
match label6  
err 