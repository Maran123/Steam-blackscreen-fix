# Steam Black Screen Fix PowerShell Script

This PowerShell script fixes the black screen issue in Steam by deleting Steam and restoring important files. A bakup is saved to C:\Temp\Steam-blackscreen-fix.

## Requirements

- Windows Operating System
- PowerShell 5.0 or higher

## Usage

1. Download the script.
2. Run PowerShell as an administrator.
3. Navigate to the directory where the script is located.
4. Run the script by typing `.\steam-blackscreen-fix.ps1` and pressing Enter.

The script will automatically detect if Steam is running and close it before proceeding. It will then create a backup of the necessary files and restore them to fix the black screen issue. Finally, the script will display a message to notify the user of its completion.

## Contributing

Contributions to this project are welcome. If you encounter any issues or have suggestions for improvement, please open an issue or submit a pull request.
