#!/bin/bash
#docker image tag python:3.8.7-buster hpcharbor.mdanderson.edu/rglenn1/python:3.8.7-buster

YML="mist_gpu_job.yml"

n=25
for (( i=17 ; i<=$n ; i++ ));  do
	cat "${YML}" | sed -e "s|#COUNT#|${i}|g" | kubectl apply -f - 
	#cat "${YML}" | sed -e "s|#COUNT#|${i}|g" | grep mountPath
done
