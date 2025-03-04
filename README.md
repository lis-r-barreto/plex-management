# Plex Management Scripts: A set of tools to automate file transfers and cleanup for Plex Media Server

## Overview

The **Plex Management Scripts** provide a set of tools to help you efficiently manage your Plex Media Server. These scripts include **`plex_cp`** for file transfer automation and **`plex_rm`** for automatic file removal, offering a streamlined way to handle your media files. Together, they ensure your Plex library remains organized and clutter-free with minimal manual effort.

---

## Instructions for `plex_cp`

1. **Clone the project** and save the file `plex_cp.sh` in your preferred directory.

2. **Open your terminal** and execute the command `pwd` in the directory where the file is located. Copy the path; you will need to insert it in steps 3 and 5.

3. **Give execution permission** to the script by running the following command:
   ```bash
   sudo chmod +x <path>/plex_cp.sh
   ```

4. **Edit the `.bashrc` file** to add a command alias:
   ```bash
   nano ~/.bashrc
   ```

5. **Add the following line** to use the command `plexcp` to execute the script:
   ```bash
   alias plexcp='<path>/plex_cp.sh'
   ```

6. **Close and reopen your terminal**. Finally, execute the command below to run the script:
   ```bash
   plexcp
   ```

---

## Instructions for `plex_rm`

1. **Clone the project** and save the file `plex_rm.sh` in your preferred directory.

2. **Open your terminal** and execute the command `pwd` in the directory where the file is located. Copy the path; you will need to insert it in steps 3 and 5.

3. **Give execution permission** to the script by running the following command:
   ```bash
   sudo chmod +x <path>/plex_rm.sh
   ```

4. **Edit the `.bashrc` file** to add a command alias:
   ```bash
   nano ~/.bashrc
   ```

5. **Add the following line** to use the command `plexrm` to execute the script:
   ```bash
   alias plexrm='<path>/plex_rm.sh'
   ```

6. **Close and reopen your terminal**. Finally, execute the command below to run the script:
   ```bash
   plexrm
   ```

---

### Key Features of the Scripts

#### `plex_cp`:
- **File Transfer Automation**: Automatically moves video files to the appropriate directories in your Plex Media Server, ensuring your library is always organized.
- **Customizable Directory Management**: Allows you to define specific directories for movies and TV shows, making it easy to manage different types of media.

#### `plex_rm`:
- **Automatic File Removal**: Deletes files from the source directory after they are successfully processed, saving storage space and reducing clutter.
- **Safe Deletion**: Includes prompts to confirm file deletions, ensuring no accidental data loss.

---

### Notes

- Both scripts are designed to work together to provide a seamless experience for managing your Plex Media Server.
- **`plex_cp`** focuses on transferring files, while **`plex_rm`** handles file cleanup.
- Always test the scripts in a safe environment before using them on important data to avoid accidental data loss.
- These tools are ideal for users who want to automate repetitive tasks and maintain a clean, organized Plex Media Server.
