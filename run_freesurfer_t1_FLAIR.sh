#!/bin/bash

#Script can be used to run Freesurfer full brain segmentation for T1+FLAIR images 
echo "all script lines commented in the end with '##', should be replaced with your specifications"

export SUBJECTS_DIR=/users/ClusterUser/vkumar/col/T1/Freesurfer1  ##
cd $SUBJECTS_DIR

echo "Freesurfer run on T1.nii"
result_dir=/users/ClusterUser/vkumar/col/T1/T1s  ##T1 path
result_dir1=/users/ClusterUser/vkumar/col/T1/FLAIRs  ## FLAIR path

cd $result_dir

for i in `cat $result_dir/list.txt`;    ##replace list.txt with your text file
do
cd $result_dir/$i

if [ -e $result_dir/$i/T1.nii ]
then
    echo "."

bsub recon-all -i $result_dir/$i/T1.nii -FLAIR $result_dir1/$i/FLAIR.nii -all -sd /users/ClusterUser/vkumar/col/T1/Freesurfer1 -s $i   ##Replace output path  #bsub is for IBM cluster , for sun grid engine replace it with fsl_sub

else
    echo "no T1 available"
	echo $i
fi
done