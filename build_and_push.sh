#!/usr/bin/env bash
# set -x

read -p 'Docker username: ' uservar
read -sp 'Docker password: ' passvar

docker login $DOCKER_REGISTRY \
    --username $uservar \
    --password $passvar

#!/usr/bin/env bash
# set -x

export dir=dmr-agent

rm -rf $dir
mkdir $dir

cp dockerfile/dmr.docker dmr-agent

cp -r A3gent/lawking $dir
cp -r A3gent/cpt $dir
cp -r A3gent/detect $dir
cp -r A3gent/detect_model $dir

cp A3gent/dmr_agent.py $dir/agent.py

export version='0511_npn_01350_110592000_totalstep3e6_lr_clip_test'

cd $dir
docker build -f dmr.docker -t keyan3/deeprlsonic285:$version .

docker push keyan3/deeprlsonic285:$version

