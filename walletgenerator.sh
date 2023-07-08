import pandas as pd
from ethereum import utils

# Load private keys from Excel file
excel_file = 'private_keys.xlsx'
df = pd.read_excel(excel_file, sheet_name='Sheet1')  # Adjust sheet name if necessary
private_keys = df['Private Key'].tolist()  # Assuming the column header is "Private Key"

# Function to generate Ethereum wallet address from private key
def generate_address(private_key):
    # Remove the "0x" prefix if present
    private_key = private_key.replace('0x', '')

    # Generate public key from private key
    public_key = utils.privtoaddr(private_key).hex()

    # Generate Ethereum address from public key
    address = utils.checksum_encode(public_key)

    return address

# Iterate over private keys and generate wallet addresses
for private_key in private_keys:
    address = generate_address(private_key)
    print("Private Key:", private_key)
    print("Wallet Address:", address)
    print()
