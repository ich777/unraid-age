# Download latest release and move files to temporary directory
cd ${DATA_DIR}
wget -q -O ${DATA_DIR}/age-${LAT_V}.tar.gz https://github.com/FiloSottile/age/releases/download/v${LAT_V}/age-v${LAT_V}-linux-amd64.tar.gz
mkdir ${DATA_DIR}/age-${LAT_V}
tar -C ${DATA_DIR}/age-${LAT_V} --strip-components=1 -xvf ${DATA_DIR}/age-${LAT_V}.tar.gz
mkdir -p ${DATA_DIR}/age${LAT_V}/usr/bin
cp ${DATA_DIR}/age-${LAT_V}/age* ${DATA_DIR}/age${LAT_V}/usr/bin/
mkdir -p ${DATA_DIR}/v$LAT_V
cd ${DATA_DIR}/age${LAT_V}
chmod -R 755 ${DATA_DIR}/age${LAT_V}/

# Create Slackware package
makepkg -l y -c y ${DATA_DIR}/v$LAT_V/$APP_NAME-"$(date +'%Y.%m.%d')".tgz
cd ${DATA_DIR}/v$LAT_V
md5sum $APP_NAME-"$(date +'%Y.%m.%d')".tgz | awk '{print $1}' > $APP_NAME-"$(date +'%Y.%m.%d')".tgz.md5