#!/bin/bash

kubectl config use-context dev

#noofpods=`kubectl top pods -n prod-business-crispycoffee`

noofpods=`kubectl top pods -n dev-business-crispycoffee | wc -l`
if [[ $(($noofpods)) -eq 5 ]]
then
        for i in {2..4}
        do
                name=`kubectl top pods -n dev-business-crispycoffee | sed -n $i'p' | awk '{print $1}'`
                cpu=`kubectl top pods -n dev-business-crispycoffee | sed -n $i'p' | awk '{print $2}' | sed 's/m//'`
                mem=`kubectl top pods -n dev-business-crispycoffee | sed -n $i'p' | awk '{print $3}' | sed 's/Mi//'`
                echo "`date +%H:%M:%S`, $name, "$(($cpu * 3))", "$(($mem * 2))""
                #echo "`date +%H:%M:%S`, $name, "$(($cpu * 3))", "$(($mem * 2))"" >> /home/prodscript/crispycoffee/data/crispycoffee_`date +%Y-%m-%d`.csv
        done
fi
