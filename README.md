# hello_nerves_ec2

This is a minimal [Nerves](https://nerves-project.org/) app which runs
on Amazon EC2. It boots up and runs an IEx shell accessible via SSH. 

It uses [nerves_system_ec2](https://github.com/cogini/nerves_system_ec2)
for the base system and [nerves_init_ec2](https://github.com/cogini/nerves_init_ec2)
to to configure the system.

See the blog post [Running Nerves on Amazon EC2](https://www.cogini.com/blog/running-nerves-on-amazon-ec2/)
for more details. 
