sudo apt-get update
sudo apt-get install software-properties-common

# Setup Chrome in Codio Environment for testing
sudo add-apt-repository ppa:canonical-chromium-builds/stage
sudo apt-get update
sudo apt-get install chromium-browser

sudo npm install -g n
sudo n 14.15.1
sudo chown -R $USER:$GROUP ~/.npm
sudo chown -R $USER:$GROUP ~/.config
yarn install
