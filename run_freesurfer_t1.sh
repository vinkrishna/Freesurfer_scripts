#!/bin/bash

echo "all script lines commented in the end with '##', should be replaced with your specifications"

export SUBJECTS_DIR=/users/ClusterUser/vkumar/col/T1/Freesurfer  ##change
cd $SUBJECTS_DIR

echo "Freesurfer run on T1.nii"
result_dir=/users/ClusterUser/vkumar/col/T1/T1s  ##change
cd $result_dir

for i in `cat $result_dir/list.txt`; ## list, with your subject input
do
cd $result_dir/$i

if [ -e $result_dir/$i/T1.nii ]
then
    echo "."

bsub recon-all -i $result_dir/$i/T1.nii -all -sd /users/ClusterUser/vkumar/col/T1/Freesurfer -s $i   ##replace output path #for IBM cluster use bsub , for sun-grid-engine replace it with fsl_sub

else
    echo "no T1"
	echo $i
fi

done