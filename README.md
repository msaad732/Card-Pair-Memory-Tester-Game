# 🃏 Memory Matching Game - x86 Assembly (Irvine32)

This project is a simple **Memory Matching Game** written in **x86 Assembly** using the **Irvine32 library**. The player selects two indices in each turn, attempting to find matching card pairs. Once all pairs are matched, the game ends with a victory message.

## 🎮 Game Features

- 8 shuffled cards with 4 matching pairs
- Revealed card tracking using a byte array
- Temporary display of chosen cards before checking match
- Input validation for already revealed cards
- Victory detection and message display

## 🧠 Game Logic

1. The game board consists of 8 cards (DWORD array).
2. A `revealed` byte array tracks which cards have been matched.
3. The user is prompted to select two card indices (0–7).
4. If both selected cards match and are unrevealed, they are marked as revealed.
5. The game continues until all cards are matched.

## 🛠 Requirements

- Windows OS
- [Irvine32 library](https://asmirvine.com)
- Assembler like **MASM** with Visual Studio or other compatible IDE

## 📁 File Structure

- `main.asm` - Main assembly file containing the entire game logic
- `Irvine32.inc` - Required include file for the Irvine library

## 🚀 How to Run

1. Set up your environment to support Irvine32 (usually Visual Studio with MASM).
2. Make sure `Irvine32.inc` and related files are in the correct include/library directories.
3. Build and run the project.

## 📝 Notes

- Ensure valid inputs (0–7) to avoid unexpected behavior.
- Selecting already revealed cards triggers a retry message.
- Feel free to contribute and improve!
