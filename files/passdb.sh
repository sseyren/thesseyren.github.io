PDB_REPO="https://gitlab.com/thesseyren/thesseyren-passdb.git"
PDB_DEST=~/storage/shared/passdb
PDB_SHORT=~/.shortcuts

if [ ! -d ~/storage ]; then
    echo "External storage initializing..."
    termux-setup-storage
fi
if [ $? != 0 ]; then
    echo "Unexpected error while termux-setup-storage."
    exit 1
fi

which git
if [ $? != 0 ]; then
    echo "Installing git..."
    pkg update && pkg install -y git
fi
if [ $? != 0 ]; then
    echo "Unexpected error while installing git."
    exit 1
fi

echo "Cloning repo..."
git config --global "credential.${PDB_REPO}.helper" store
git clone $PDB_REPO $PDB_DEST
if [ $? != 0 ]; then
    echo "Unexpected error while cloning repo."
    exit 1
fi

echo "Linking and configuring passdb path..."
git config --global --add safe.directory `realpath $PDB_DEST`
ln -s $PDB_DEST ~

echo "Creating shortcuts..."
mkdir $PDB_SHORT

cat <<EOF > ${PDB_SHORT}/pdb-pull.sh
cd ~/passdb
git pull
sleep 1
EOF

chmod u+rwx -R $PDB_SHORT

echo "Setup complete!"
