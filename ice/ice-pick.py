######################################################################################################################
######################################################################################################################
######################################################################################################################
from algosdk.v2client import algod
from algosdk import account, encoding, mnemonic, transaction
from algosdk.transaction import PaymentTxn, ApplicationCallTxn, AssetTransferTxn, OnComplete, ApplicationOptInTxn, assign_group_id, AssetOptInTxn, LogicSigAccount, LogicSigTransaction, LogicSig
from algosdk.v2client.algod import AlgodClient
import base64
######################################################################################################################
######################################################################################################################
######################################################################################################################
user_mnemonic = "fruit climb pelican vicious absent mesh program alarm siren deliver lawsuit cram upgrade priority elephant claw hero this mandate syrup essay object reject abstract mouse"
user_address = "Q4HNMIAR7DJ6WB6EIR7AX62B2Z4HHD7CA4KISQQ5NM22KIMKKDK54QBRH4"
user_private_key = mnemonic.to_private_key(user_mnemonic)
algod_client = AlgodClient('', 'https://mainnet-api.algonode.cloud', headers={'User-Agent': 'algosdk'})
######################################################################################################################
######################################################################################################################
######################################################################################################################
burn_address = "BNFIREKGRXEHCFOEQLTX3PU5SUCMRKDU7WHNBGZA4SXPW42OAHZBP7BPHY"
sender_address = "BNFIREKGRXEHCFOEQLTX3PU5SUCMRKDU7WHNBGZA4SXPW42OAHZBP7BPHY"
reciever_address = "Q4HNMIAR7DJ6WB6EIR7AX62B2Z4HHD7CA4KISQQ5NM22KIMKKDK54QBRH4"
asset_id = 297995609
app_id = 1257620981
######################################################################################################################
######################################################################################################################
######################################################################################################################
print("--------ARGS----------")
app_args = [b"", b""]
print("app args:", app_args)
print("------------------")
######################################################################################################################
######################################################################################################################
######################################################################################################################
txn_0 = PaymentTxn(sender=address, sp=params, receiver=pool_address, amt=1000)
txn_1 = OnComplete(sender=burn_address, sp=params, index=app_id, on_complete=UpdateApplicationOC, app_args=app_args, foreign_assets=[asset_id_1], accounts=[burn_address, sender_address, reciever_address])
txn_1 = OnComplete(sender=burn_address, sp=params, index=app_id, on_complete=UpdateApplicationOC, app_args=app_args, foreign_assets=[asset_id_1], accounts=[burn_address, sender_address, reciever_address])