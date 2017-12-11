# atomic-fedora-tools
Container to be used on Fedora Atomic for missing tools.

On Fedora Atomic Host (and Centos too), one can use a specific
tools container to get specific package on top of the ostree base
file system.

The setup is not documented for now, but can be summarized as:

    # echo TOOLSIMG=registry.fedoraproject.org/f26/tools >> /etc/sysconfig/atomic

to use the tools container from Fedora project.

However, while lots of tools are present, they are running in a specific
container with the host filesystem is mounted on /host.

Which mean that vim /etc/foo will not open /etc/foo since it will be running with
a different filesystem. However, vim /host/etc/foo will break tab completion.

So this tools container is modified with a custom vim function to add a /host
prefix to each file before opening them.
