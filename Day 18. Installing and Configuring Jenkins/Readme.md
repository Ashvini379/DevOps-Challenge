# Jenkins Installation

## Linux

It can be installed from the debian-stable apt repository.

```
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```

## Explore Jenkins UI

Open browser http://localhost:8080. You will see unlock Jenkins page that shows you where the initial admin password is located.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/78f756ab-5a62-4648-ac6d-6c7101a2f93e)


Open the terminal and run the following command to get initialAdminPassword:
```
Sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Copy the outputted password and paste it into unlock Jenkins page in the browser.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/48f91e70-24fa-4aab-bc76-45b71b4263f0)

There is an option to install suggested plugins here.
Proceed to "Select plugins to install."
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/1a06e1bd-25b2-4077-9997-778ec4017e23)

Here various plugins are selected by default and shown as recommended.
Unselect all except Folder, Pipeline, and SSH Build Agents, and click on Install.
On the next screen select “Skip and proceed as Admin” though you can also create a custom user.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/ce75fedf-673e-4ce9-8150-dbe0aa57a907)

On the “Instance configuration” screen leave Jenkins URL unchanged.
To continue, click on "Start using Jenkins."
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/a12633c8-942c-44e6-b529-97a199e635f9)


This shows the main page where you can explore Jenkins UI.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/2aea6e9a-6923-492a-b236-1c33744d9fa9)


## Jenkins UI: Create First Job

Explore Jenkins UI and create a job.

Solution:

Open browser http://localhost:8080 and enter provided credentials.

![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/3b1b6ef8-8b81-495f-8ca5-f1d80d28bbe1)


Add job name in this field; choose Freestyle project and click “OK” as shown in the screenshot below.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/769bd156-cd2f-47ae-bc0a-bb703cb87d23)


Add a custom description ‘Description of my job’ for this job in the following field:
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/6b3415c1-ce5f-4302-913b-45f044ecc326)


Scroll down to the “Build Steps” section.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/903108c0-7f72-435f-8518-1d4e051c55b2)


Add the following lines in the command section.
```
echo "This is output of my first Jenkins job!"
date
```
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/8148d016-b88c-42fc-9e00-3d4518dcc2f6)

Click the “Save” button.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/94c2f462-ce6d-4efd-97a8-351ae8aed7de)

After that you will be redirected to the project page where you can see the set description of your job:
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/6316b150-62a3-4153-bb9e-519001b1310a)

Click on Build Now to trigger the job.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/e7da1d2b-08af-435f-af21-71a85f6e73eb)

Output

The completed build history can be seen in the bottom left corner.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/e9f40167-8901-41f9-b147-5de138f79ac1)

Click on the last build to see logs.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/4383874c-90ba-4f47-ad63-b457915530b5)


Click on the last build to see logs.
