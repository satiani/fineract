#!/bin/bash

SCRIPT_ROOT=$(cd `dirname $0` && pwd)

rsync -avz -e "ssh -i ~/.ssh/newbery-aws.pem" admin@mifos.liwwahq.com:~/code/incubator-fineract/ $SCRIPT_ROOT/ 
rsync -avz -e "ssh -i ~/.ssh/newbery-aws.pem" $SCRIPT_ROOT/ admin@mifos.liwwahq.com:~/code/incubator-fineract/
