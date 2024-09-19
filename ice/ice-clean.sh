#pragma version 9  
intcblock 0 1  
txn ApplicationID  
intc_0  
>  
pushint 6  
*  
txn OnCompletion  
+  
switch label1 label2 label2 label2 label2 label2 label3  
label2:  
err  
label6:  
txna ApplicationArgs 1  
btoi  
txnas Assets  
callsub label4  
intc_1  
return  
label4:  
proto 1 0  
itxn_begin  
pushint 4  
itxn_field TypeEnum  
global CurrentApplicationAddress  
itxn_field AssetReceiver  
frame_dig -1  
itxn_field XferAsset  
intc_0  
itxn_field AssetAmount  
intc_0  
itxn_field Fee  
itxn_submit  
retsub  
label5:  
intc_1  
return  
label1:  
pushbytes 0xb8447b36  
txna ApplicationArgs 0  
match label5  
err  
label3:  
pushbytes 0x44f8d5de  
txna ApplicationArgs 0  
match label6  
err  