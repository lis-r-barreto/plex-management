# Video File Management Script

## Instructions

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

5. **Add the following line** to use the command `videomanager` to execute the script:
   ```bash
   alias plexcp='<path>/plex_cp.sh'
   ```

6. **Close and reopen your terminal**. Finally, execute the command below to run the script:
   ```bash
   plexcp
   ```

### Note
- The script will permanently delete files from the source directories after copying. Ensure you want to delete all contents before running it. Always test the script in a safe environment to avoid accidental data loss.
