import os
import shutil
import schedule
import time
import zipfile

def doprocess(source_folder, target_zip):
    zipf = zipfile.ZipFile(target_zip, "w")
    for subdir, dirs, files in os.walk(source_folder):
        for file in files:
            print(os.path.join(subdir, file))
            zipf.write(os.path.join(subdir, file))
    print("Created ", target_zip)

def backup(src, dst):    
    shutil.copy(src,destination)

def schedule_backup():
    time = "07:26"  # schedule time in 24h format
    schedule.every().day.at(time).do(backup, destzip, destination)
    print(f"Backup scheduled for {time} every day")
    while True:
        schedule.run_pending()
        time.sleep(1)

if __name__ == "__main__":
    source = "path/to/source/directory"
    destination = "path/to/destination/directory"
    schedule_backup()
