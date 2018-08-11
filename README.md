# hello_nerves_ec2

This is a minimal [Nerves](https://nerves-project.org/) app which runs
on Amazon EC2. It boots up and runs an IEx shell accessible via SSH.

It uses [nerves_system_ec2](https://github.com/cogini/nerves_system_ec2)
for the base system and [nerves_init_ec2](https://github.com/cogini/nerves_init_ec2)
to to configure the system.

See the blog post [Running Nerves on Amazon EC2](https://www.cogini.com/blog/running-nerves-on-amazon-ec2/)
for more details.

# Work in Progress

## Run with an IAM instance profile

Working but not well documented...

https://console.aws.amazon.com/iam/home

In order to access AWS resources, the program needs to have the necessary
permissions. Rather than hard-coding credentials, EC2 lets us associate an IAM
role with an instance at startup. It then makes the IAM keys available to
the instance via an HTTP API.

An instance profile is a "wrapper" for an IAM role. Roles can contain multiple
policies which give access to resources.

Create a policy which allows the instance to write logs to CloudWatch Logs.

In the AWS console, under AWS Service | EC2
"Create Policy", "JSON" tab.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogStreams"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
```
