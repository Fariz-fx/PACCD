## Code related Pipeline

If any changes made **.py** file in **api** Directory trigger below 3 pipelines
1. Python Build & test 
2. Docker Build & Push
3. TBD1 - Test Build & Deploy 
4. PBD1 - Production Build & Deploy Pipeline will run 

We have 2 check pipeline which will run when we trigger Pull request
1. Python Build & test 
2. Docker Build & Push

Once its successfully done.
The approver can able to approve pull request

Then automatically TBD1 Container App Pipeline will run
* TBD1 - Test Build & Deploy 

Then to push to production, the approver have to approve the request
Then 
* PBD1 - Production Build & Deploy Pipeline will run 


## Infra related Pipeline

We have a Bicep deployment related Pipeline  
1. iac-code-scan
2. iac-deploy

iac-code-scan - which will run when we trigger pull request in iac path
iac-deploy - After pull request approval, this pipeline will be deployed
