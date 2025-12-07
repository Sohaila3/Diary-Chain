# 📖 Diary Chain - Immutable Blockchain Journal

A decentralized application (DApp) built on **Celo Mainnet** that allows users to write permanent, timestamped diary entries on the blockchain. Once written, entries become **immutable**—they cannot be changed or deleted, creating a permanent record of your thoughts and experiences.

---

## 🌟 Features

### ✨ Core Functionality
- **Immutable Entries**: Once saved to the blockchain, your diary entries are permanent and cannot be altered
- **Blockchain Timestamps**: Every entry is automatically timestamped using `block.timestamp`
- **Personal Timeline**: View all your entries in chronological order
- **MetaMask Integration**: Seamless wallet connection with automatic Celo network switching
- **Beautiful UI**: Minimalist journal-themed design with paper textures and serif fonts

### 🔒 The Immutability Guarantee

**What makes Diary Chain special?**

Traditional digital journals can be:
- ✗ Edited after the fact
- ✗ Deleted by accident or on purpose
- ✗ Lost if the service shuts down
- ✗ Modified by third parties

**Diary Chain entries are:**
- ✓ **Permanently stored** on the Celo blockchain
- ✓ **Timestamped** with cryptographic proof
- ✓ **Immutable** - cannot be changed once written
- ✓ **Censorship-resistant** - no one can delete your entries
- ✓ **Decentralized** - your data lives on a distributed network

Once you click "Save to Chain," your entry becomes part of blockchain history forever.

---

## 🚀 Quick Start

### Prerequisites
1. **MetaMask** browser extension installed ([Download here](https://metamask.io/download/))
2. **CELO tokens** for gas fees ([Get testnet CELO from faucet](https://faucet.celo.org/) or buy on mainnet)
3. A modern web browser (Chrome, Firefox, Brave, etc.)

### Deployment Steps

#### 1. Deploy the Smart Contract

**Option A: Using Remix IDE (Recommended for beginners)**

1. Go to [Remix IDE](https://remix.ethereum.org/)
2. Create a new file called `Diary.sol`
3. Copy the contents of `Diary.sol` into the file
4. Compile the contract (Solidity 0.8.0+)
5. Deploy:
   - Go to "Deploy & Run Transactions" tab
   - Set Environment to "Injected Provider - MetaMask"
   - Make sure MetaMask is connected to **Celo Mainnet** (Chain ID: 42220)
   - Click "Deploy"
   - Confirm the transaction in MetaMask
6. **Copy the deployed contract address**

**Option B: Using Hardhat/Foundry**

```bash
# Add Celo Mainnet RPC
# RPC URL: https://forno.celo.org
# Chain ID: 42220

# Deploy using your preferred tooling
npx hardhat run scripts/deploy.js --network celo
```

#### 2. Configure the Frontend

1. Open `index.html`
2. Find line ~214:
   ```javascript
   const CONTRACT_ADDRESS = "YOUR_DEPLOYED_CONTRACT_ADDRESS_HERE";
   ```
3. Replace with your actual deployed contract address:
   ```javascript
   const CONTRACT_ADDRESS = "0xYourActualContractAddress";
   ```
4. Save the file

#### 3. Run the Application

**Option A: Simple HTTP Server**
```bash
# Python 3
python -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000

# Node.js
npx http-server -p 8000
```

**Option B: VS Code Live Server**
1. Install "Live Server" extension in VS Code
2. Right-click `index.html` → "Open with Live Server"

**Option C: Direct File Opening**
- Simply double-click `index.html` (may have limited functionality)

#### 4. Connect & Write

1. Open the app in your browser
2. Click **"Connect Wallet"**
3. MetaMask will prompt you to:
   - Connect your account
   - Switch to Celo Mainnet (automatic)
4. Navigate to **"Write Entry"**
5. Write your diary entry
6. Click **"Save to Chain"**
7. Confirm the transaction in MetaMask
8. Wait for blockchain confirmation
9. View your entry in **"My Timeline"**

---

## 📁 Project Structure

```
Diary Chain/
│
├── index.html          # Frontend application (HTML + CSS + JS)
├── Diary.sol           # Smart contract (Solidity)
└── README.md           # This file
```

### `index.html`
- **Framework**: Vanilla JavaScript + Tailwind CSS
- **Web3 Library**: ethers.js v5.7
- **Design**: Minimalist journal theme with paper textures
- **Sections**:
  - Home: Landing page with feature overview
  - Write Entry: Textarea with save functionality
  - My Timeline: Chronological display of all entries

### `Diary.sol`
- **Solidity Version**: ^0.8.0
- **Contract Features**:
  - `addEntry(string)`: Store a new diary entry
  - `getEntries(address)`: Retrieve all entries for a user
  - `getEntryCount(address)`: Get total entry count
  - `getEntry(address, uint256)`: Get a specific entry by index
- **Data Structure**:
  ```solidity
  struct Entry {
      string content;      // Entry text
      uint256 timestamp;   // Block timestamp
  }
  ```

---

## 🔧 Technical Details

### Network Configuration

**Celo Mainnet**
- **Chain ID**: 42220 (0xA4EC in hex)
- **RPC URL**: https://forno.celo.org
- **Block Explorer**: https://explorer.celo.org
- **Native Currency**: CELO

The app automatically switches to Celo Mainnet when you connect your wallet.

### Smart Contract Functions

#### `addEntry(string memory _content)`
- Stores a new diary entry for the caller
- Automatically adds `block.timestamp`
- Emits `EntryAdded` event
- **Gas Cost**: ~50,000-100,000 gas (varies by content length)

#### `getEntries(address _user)`
- Returns all entries for a specific address
- View function (no gas cost)
- Returns array of `Entry` structs

#### `getEntryCount(address _user)`
- Returns the total number of entries
- Useful for pagination

### Gas Costs

Approximate gas costs on Celo:
- **Deploy Contract**: ~500,000 gas (~$0.01-0.05)
- **Add Entry (short)**: ~50,000 gas (~$0.001-0.01)
- **Add Entry (long)**: ~100,000 gas (~$0.002-0.02)

*Actual costs depend on network congestion and CELO price*

---

## 🎨 Design Philosophy

The UI is designed to evoke the feeling of writing in a physical journal:

- **Color Palette**: Warm paper tones (#fffef9, #f5ebe0)
- **Typography**: Serif fonts (Libre Baskerville, Lora)
- **Textures**: Paper-like backgrounds with subtle shadows
- **Animations**: Smooth transitions and hover effects
- **Minimalism**: Clean, distraction-free writing environment

---

## 🔐 Security Considerations

### Smart Contract Security
- ✓ No `onlyOwner` functions - fully decentralized
- ✓ No funds handling - no risk of financial loss
- ✓ Simple, auditable code
- ✓ Input validation (empty check, length limit)
- ⚠️ Entries are public - anyone can read them via blockchain

### Privacy Notice
⚠️ **IMPORTANT**: All entries are stored on a public blockchain. Do not write:
- Private keys or passwords
- Sensitive personal information
- Illegal content
- Information you wouldn't want public

Blockchain data is permanent and publicly accessible.

---

## 🐛 Troubleshooting

### "MetaMask is not installed"
→ Install MetaMask from https://metamask.io/download/

### "Please switch to Celo Mainnet"
→ The app should auto-switch. If not, manually add Celo Mainnet in MetaMask:
- Network Name: Celo Mainnet
- RPC URL: https://forno.celo.org
- Chain ID: 42220
- Currency: CELO
- Explorer: https://explorer.celo.org

### "Insufficient funds for gas"
→ You need CELO tokens for gas fees. Get them from:
- [Valora Wallet](https://valoraapp.com/)
- Crypto exchanges (Binance, Coinbase, etc.)
- Testnet faucet: https://faucet.celo.org/ (for testing)

### "Transaction failed"
→ Check:
- Correct network (Celo Mainnet)
- Sufficient CELO for gas
- Contract address is correct
- Entry is not empty

### "Failed to load entries"
→ Verify:
- Contract address is correct in `index.html`
- Wallet is connected
- You're on the correct network

---

## 🛠️ Customization

### Change Contract Address
Edit line ~214 in `index.html`:
```javascript
const CONTRACT_ADDRESS = "0xYourNewAddress";
```

### Modify Character Limit
Edit `Diary.sol` line ~37:
```solidity
require(bytes(_content).length <= 10000, "Entry content too long");
```

### Change Theme Colors
Edit the `<style>` section in `index.html`:
```css
.btn-primary {
    background: linear-gradient(135deg, #8b6f47 0%, #6b5638 100%);
}
```

---

## 📊 Contract Verification (Optional)

To verify your contract on Celo Explorer:

1. Go to https://explorer.celo.org/
2. Search for your contract address
3. Click "Verify & Publish"
4. Enter:
   - Compiler: v0.8.0+
   - Source code from `Diary.sol`
   - Optimization: No
5. Submit

This makes your contract publicly verifiable and trustworthy.

---

## 🌍 Use Cases

- **Personal Journal**: Daily thoughts and reflections
- **Project Logs**: Track development progress immutably
- **Life Milestones**: Record important life events with proof of date
- **Idea Repository**: Store ideas with timestamped proof of conception
- **Accountability**: Public commitment tracking
- **Digital Time Capsule**: Messages to your future self

---

## 🤝 Contributing

This is an open-source educational project. Feel free to:
- Fork and modify for your needs
- Add new features (e.g., encryption, categories, search)
- Improve the UI/UX
- Deploy on other EVM-compatible chains

---

## 📜 License

MIT License - Free to use, modify, and distribute.

---

## 🔗 Resources

- **Celo Docs**: https://docs.celo.org/
- **MetaMask**: https://metamask.io/
- **Ethers.js**: https://docs.ethers.org/
- **Solidity**: https://docs.soliditylang.org/
- **Tailwind CSS**: https://tailwindcss.com/

---

## ⚠️ Disclaimer

This DApp is for educational purposes. While the smart contract is simple and secure, it has not been professionally audited. Use at your own risk. The immutability feature means you cannot delete entries once saved—write responsibly!

---

## 🎯 What Makes This Unique?

Unlike centralized journaling apps:
- ✓ **No company can shut down** your diary
- ✓ **No one can censor** your entries
- ✓ **Cryptographically timestamped** proof of when you wrote something
- ✓ **Decentralized storage** across Celo's global network
- ✓ **True ownership** - your entries, your keys, your data

**Your thoughts, preserved forever on the blockchain. 📖⛓️**

---

*Built with ❤️ for the Celo ecosystem*
