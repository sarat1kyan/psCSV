# psCSV

_**Certificate Installer PowerShell Script**_

**Overview**
This PowerShell script automates the installation of certificates on user computers based on mappings provided in a CSV file. It simplifies the process of deploying certificates to multiple users in a domain or network environment.

**🚀 Features**
Automated Installation: Install certificates for multiple users without manual intervention.
Error Handling: Robust error handling ensures smooth execution and provides detailed logs for troubleshooting.
Logging: Log messages with timestamps and severity levels for better visibility and record-keeping.
Customizable: Configure paths and settings to suit your environment.

**💻 Usage**
Prepare Certificate Files: Place your certificate files (.cer) in a folder. Ensure each certificate file is named appropriately, corresponding to the username it belongs to.

Create CSV Mapping File: Create a CSV file with two columns: Username and CertificateFilePath. Populate this file with mappings of usernames to their respective certificate file paths.

**Example certificates.csv:**

Username,CertificateFilePath

user1,C:\Path\To\Certificates\user1.cer

user2,C:\Path\To\Certificates\user2.cer

**Download and Customize Script:** Download the psCVS.ps1 script from this repository. Customize the script parameters such as $csvFilePath according to your environment.

**Run the Script:** Open PowerShell as an administrator and navigate to the directory containing the script.
Execute the script by running .\psCSV.ps1.

**Monitor Logs:** Check the console output and log file (logfile.txt) for status and error messages. Ensure that all certificates are installed successfully.

**📝 Notes**
This script is designed to run on Windows computers with PowerShell installed.
Ensure that certificate files and the CSV mapping file are accessible to the script.
Review and customize the script according to your organization's security and deployment requirements.
