# Jenkins Installation

## Linux

It can be installed from the debian-stable apt repository.

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins

## Explore Jenkins UI

Open browser http://localhost:8080. You will see unlock Jenkins page that shows you where the initial admin password is located.

Open the terminal and run the following command to get initialAdminPassword:

Sudo cat /var/lib/jenkins/secrets/initialAdminPassword

Copy the outputted password and paste it into unlock Jenkins page in the browser.

There is an option to install suggested plugins here.
Proceed to "Select plugins to install."

Here various plugins are selected by default and shown as recommended.
Unselect all except Folder, Pipeline, and SSH Build Agents, and click on Install.
On the next screen select “Skip and proceed as Admin” though you can also create a custom user.

On the “Instance configuration” screen leave Jenkins URL unchanged.
To continue, click on "Start using Jenkins."

This shows the main page where you can explore Jenkins UI.

## Jenkins UI: Create First Job

Explore Jenkins UI and create a job.

Solution:

Open browser http://localhost:8080 and enter provided credentials.

Add job name in this field; choose Freestyle project and click “OK” as shown in the screenshot below.

Add a custom description ‘Description of my job’ for this job in the following field:

Scroll down to the “Build Steps” section.

Add the following lines in the command section.

echo "This is output of my first Jenkins job!"
date

Click the “Save” button.

After that you will be redirected to the project page where you can see the set description of your job:

Click on Build Now to trigger the job.

Output

The completed build history can be seen in the bottom left corner.

Click on the last build to see logs.