sudo apt update && sudo apt upgrade -y \
  && sudo apt install -y \
  avahi-daemon tcpdump ncdu unar tmux jq tree \
  htop sysstat curl wget git unzip build-essential \
  make cmake ripgrep bat libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev cargo\
  libffi-dev liblzma-dev xz-utils tk-dev openssh-server

curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc

(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

sudo snap install glab
sudo dpkg -i glab_1.93.0_linux_amd64.deb

source ~/.bashrc
mise use -g node@lts
source ~/.bashrc

curl -fsSL https://claude.ai/install.sh | bash
npm install -g @google/gemini-cli
npm i -g @openai/codex

sudo apt-get clean
sudo apt-get autoremove --purge -y
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*
