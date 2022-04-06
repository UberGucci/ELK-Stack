# Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](https://github.com/UberGucci/ELK-Stack/blob/21bed620d84a9b1c7519b6953650433908a12b01/Diagrams/Azure-VM-ELK-VM.PNG)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  ![Filebeat-Playbook](https://github.com/UberGucci/ELK-Stack/blob/e1ba340908e9e1b1001e6165433cad6c60c9c8f7/Ansible/filebeat-playbook.yml)
  
  ![Metricbeat-Playbook](https://github.com/UberGucci/ELK-Stack/blob/a0db13fc6fff6c04cd87865d8414f46bf51e7adf/Ansible/metricbeat-playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting inbound access to the network. The load balancer ensures that work to process incoming traffic will be shared by both vulnerable web servers. Access controls will ensure that only authorized users --namely, ourselves -- will be able to connect in the first place.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file systems of the VMs on the network, as well as watch system metrics, such as CPU usage; attempted SSH logins; sudo escalation failures; etc.

The configuration details of each machine may be found below.

| Name                 | Function                   | IP Address | Operating System |
|----------------------|----------------------------|------------|------------------|
| Jump-Box-Provisioner | Gateway                    | 10.1.0.4   | Ubuntu LTS 18.04 |
| Elk                  |   Application Server       | 10.0.0.4   | Ubuntu LTS 18.04 |
| Web-1                |   Application Server       | 10.1.0.5   | Ubuntu LTS 18.04 |
| Web 2                |   Application Server       | 10.1.0.6   | Ubuntu LTS 18.04 |
| Web-3                |   Application Server       | 10.1.0.7  | Ubuntu LTS 18.04 |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 136.50.150.238

Machines within the network can only be accessed by my docker conatiner running on my jumpbox. My personal machine (136.50.150.238) was allowed to access the ELK VM through port 80, and 5601; my jumpbox (10.1.0.4) was allowed to access the machine through SSH. 

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 |   136.50.150.238     | 
|  Web 1   |   no                |   10.1.0.5           |
|  Web 2   |   no                |       10.1.0.6       |
|  Web 3   |   no                |           10.1.0.7   |
| ELK VM   | no/yes              | 10.0.0.4/ My IP 5601 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
Ansible is a automation tool that allows you to configure provision, and manage application deployment on an infinite amount of machines dependent on networks needs.

The playbook implements the following tasks:
- Installs docker.io to the ELK machine
- Installs pip3 (python 3) 
- Installs docker python module
- Increase the virtual memory of the ELK machine
- Download and launch the docker ELK container, configuring - publishing the ports for elasticsearch, logstash, kibana.


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Web 1 10.1.0.4
Web 2 10.1.0.5
Web 3 10.1.0.6
ELK  10.0.0.4

We have installed the following Beats on these machines:
- FileBeat 
- MetricBeat

These Beats allow us to collect the following information from each machine:
- Filebeat monitors logs or specified locations and forwards it to the ELK machine.
- Metricbeat periodically collects metric data from your target service such as CPU or memory related metrics, and collect services running on this server. It can also be used to monitor other beats in the ELK stack itself. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Playbook file to /etc/ansible.
- Update the configuration file to include the IP address of the ELK machine as well as update the host file to contain the IP's of the ELK server or WEB server.
- Run the playbook, and navigate to ELK servers public IP on port 5601 to check that the installation worked as expected.
