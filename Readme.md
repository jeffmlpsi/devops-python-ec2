Before running:  
- create a security group in us-west-1 named: AllowSshHttpHttps
    This security group needs inbound rules that open ports:   22,80,443, 8080
- make sure you have an ssh key from us-west-1 and you know where it is on your machine  
- Install Python 3.10 or later
- Install boto3, the Python API for AWS, with pip3
- install paramiko, the ssh API for Python, with pip3
- Make sure your AWS SSO user is active by running: aws configure sso. 
- Make sure you name the AWS SSO profile iam-profile, since that is used in the code.

To run: 
run.sh:              
- python3 st34.py "AllowSshHttpHttps" TestKeyPair-US-West-1 ../../keypairs  
or  
- run-and-delete.sh:     
- python3 st34.py "AllowSshHttpHttps" TestKeyPair-US-West-1 ../../keypairs -d  

Change to keypair file name to match what is on your system. And, the path to the folder that contains the keypairs.

### In Visual Studio Code you can create debug configuration in launch.json for your project. For example:

{  
    "version": "0.2.0",  
    "configurations": [  
        {  
            "name": "st34.py, Python Debugger: Current File",  
            "type": "debugpy",  
            "request": "launch",  
            "program": "st34.py",  
            "console": "integratedTerminal",  
            "args": ["AllowSshHttpHttps", "TestKeyPair-US-West-1","../../keypairs"]  
        },  
        {  
            "name": "st34.py delete on exit   
            Python Debugger:Current File",  
            "type": "debugpy",  
            "request": "launch",  
            "program": "st34.py",  
            "console": "integratedTerminal",  
            "args": ["AllowSshHttpHttps", "TestKeyPair-US-West-1","../../keypairs","-d"]  
        }  
    ]  
}  

