sudo apt update
sudo apt install openjdk-11-jdk -y
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
[200~sudo apt update && sudo apt upgrade -y
sudo apt install openjdk-17-jdk -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo apt update -y
sudo apt upgrade -y
sudo apt install openjdk-11-jdk -y
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
mkdir -p ~/app
ls -lhtr
mkdir springboot-ec2-jenkins-demo/
cd springboot-ec2-jenkins-demo/
cd ..
rm springboot-ec2-jenkins-demo/
mkdir -p springboot-ec2-jenkins-demo/src/main/java/com/example/demo/{controller,model,repository,service}
mkdir -p springboot-ec2-jenkins-demo/src/main/resources
touch springboot-ec2-jenkins-demo/src/main/java/com/example/demo/DemoApplication.java
touch springboot-ec2-jenkins-demo/src/main/java/com/example/demo/controller/UserController.java
touch springboot-ec2-jenkins-demo/src/main/java/com/example/demo/model/User.java
touch springboot-ec2-jenkins-demo/src/main/java/com/example/demo/repository/UserRepository.java
touch springboot-ec2-jenkins-demo/src/main/java/com/example/demo/service/UserService.java
touch springboot-ec2-jenkins-demo/src/main/resources/application.properties
touch springboot-ec2-jenkins-demo/pom.xml
ls -lhtr
cd springboot-ec2-jenkins-demo/
ls -lhtr
vi pom.xml 
cd src/
ls -lhtr
cd main/
ls -lhtr
cd java/
cd com/
cd example/
cd demo/
ls -lhtr
vi DemoApplication.java 
cd model/
ls -lhtr
vi User.java 
cd ..
cd repository/
ls -lhtr
vi UserRepository.java 
cd ..
cd service/
vi UserService.java 
cd ..
cd controller/
vi UserController.java 
cd ../../../../
cd ..
ls -lhtr
cd ..
ls -lhtr
cd main/
cd resources/
ls -lhtr
vi application.properties 
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/dinesh12-pm/springbootwithpipeline.git
git push -u origin main
cd ..
cd springboot-ec2-jenkins-demo/
cd ..
gti init
git init
git add .
git commit -m "M"
git branch -M main
git remote add origin https://github.com/dinesh12-pm/springbootwithpipeline.git
git push -u origin main
ls-lhtr
ls -lhtr
cd springboot-ec2-jenkins-demo/
touch Jenkinsfile
vi Jenkinsfile 
ssh-keygen -t rsa -b 4096 -C "jenkins-ec2-deploy"
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@184.73.37.196
sudo ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@184.73.37.196
ssh -i target-key.pem ubuntu@184.73.37.196
ls -lhtr
cd ..
git add .
git commit -m "m"
git push origin main 
cd springboot-ec2-jenkins-demo/
ls -lhtr
cp Jenkinsfile ../
cd ..
ls -lhtr
git add .
git comit -m "m"
git commit -m "m"
git push origin main
sudo apt update
sudo apt install -y openjdk-17-jdk
java -version
readlink -f $(which java)
vi Jenkinsfile 
rm Jenkinsfile 
touch Jenkinsfile 
vi Jenkinsfile 
git add .
git commit -m "m"
git push origin main 
ls -lhtr
cd springboot-ec2-jenkins-demo/
ls -lhtr
cp pom.xml ../
cd //
ls -lhtr
exit
ls -lhtr
