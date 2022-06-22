_Data classification: public. This is a public Github repository_

How to create a remote development environment
==============================================

Most developers use their MacBook for development. You might, for some reason, prefer a remote development environment. Possible reasons include:

- your notebook gets so hot that it causes irreversible protein denaturation in your palm
- your Apple device is equipped with a CPU that is 3 years ahead of its time (i.e. does not run Docker)
- Microsoft Windows

This article gives some instructions on how to offload development tasks to the cloud.

Local Installations
-------------------

On your local machine, you need the following tools

- Git. On Windows, use https://gitforwindows.org/
- The AWS CLI: https://aws.amazon.com/cli/
- An editor like Microsoft Visual Code or its open-source sibling Codium. https://code.visualstudio.com/, https://vscodium.com/
- Terraform. https://www.terraform.io/downloads
- aws-sso to get credentials for your AWS account
- If on Windows, you might like Windows Terminal.


Create the Cloud Environment
----------------------------

Your central resource will be an EC2 instance. We use terraform to set it up. See the terraform directory in this repo. *Make sure you review and edit all the settings!*

Run it against your temporary AWS account or a dev account.

Configure SSH
-------------

On your local machine, configure SSH so that you can directly ssh into your DEV environment. See the snippet directory in this repo. Create and exchange SSH keys. When you are done, the following commmand should include all required configuration and just work:

```
ssh remote-development
```

If this gives you a shell on your EC2 machine, you are done.

Configure Visual Code for Remote Development
--------------------------------------------

Install the extension "remote-ssh" and follow the instructions. You can skip the part "Remote SSH: Add new SSH host" - we have done this already.

With the command "Remote SSH: Connect to Host", a new VS Code windows should open.

TODO
----

* EC2 Terminate behavior: shutdown, not terminate, so that it's easy to save running costs
* Script/shell function/alias to list, start, stop EC2 instances using AWS CLI
* Script/shell function/alias to setup port forwarding

