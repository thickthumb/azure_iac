This project was inspired bt INFINION technologies. 
TASK #3 as stated in mail received. 

# Solution

1. Creation or identification of resource group. in my case a resource group was already created so i went on with using it. 

2. created a network configuration

in this step i created a network security group, a public ip address resource, and the virtual machine resource...
* while creating the virtual machine i made sure to open needed ports for accessing the virtual machine for this use case port 80 which is the default port for http(apache).


![sScreenshot1](/screenshots/2024-05-29%2015.44.39%20Create%20network%20security%20group.png)
 
 ![screenshot2](/screenshots/2024-05-29%2016.17.26%20Create%20public%20IP%20address%20-%20Mic.png)


 ![screenshot2](/screenshots/2024-05-29%2017.08.38%20Create%20a%20virtual%20machine%20-%20Mic.png)

 3.Connected to vm using ssh,  and Configured Apache2 on the virtual machine (hostvm1) using a reuseable bashscript lamp.sh

 ![screenshot2](/screenshots/2024-05-29%2017.14.44%2020.33.62.119%20(azureuser).png)
 * Downloaded the private create and used it in accessing the vm

 
 ![screenshot2](/screenshots/2024-05-29%2017.17.46%2020.33.62.119%20(azureuser).png)

* lamp.sh creation 

 ![bashA](/screenshots/zzz.png)
 ![bashb](/screenshots/zzzz.png)


 5. Confirm webpage works right. 

 ![](/screenshots/2024-05-29%2018.58.18%20WP-pusher-checkbox%20-%20Google%20Ch.png)
 
 ## Thanks for the experience.