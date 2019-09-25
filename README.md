# x86 下制作 ARM Docker 镜像
~~~
Docker Hub 不仅提供镜像的存储共享服务，也提供简单的镜像自动构建服务。自动构建服务给每个用户分配了一台 2GB 内存、1 核心 CPU、30GB 硬盘的
完整虚拟机运行 2 小时（来自 Docker 官方论坛），并且用户具有 root 权限。

默认的自动构建相当于是我们构建镜像时运行的 docker build 那一步，但是我们需要在这之前注册 qemu-user-static 虚拟机。我们可以用 Docker 官
方提供的 hook 在构建开始前运行自定义的命令（来自 Docker Cloud 文档）。因为我们分配到的是完整的虚拟机，有 root 权限，
所以我们也可以在 hook 中注册虚拟机。

如何创建这样一个 hook？在 Dockerfile 的文件夹下创建 hooks 文件夹，再在 hooks 文件夹下创建 pre_build 文件，内容如下：

#!/bin/sh
docker run --rm --privileged multiarch/qemu-user-static:register --reset
可以在我的这个 commit 中看到 hook 的示例。

Docker Hub 的自动构建服务会先运行这个脚本注册 qemu-user-static，然后再开始构建。构建完成时 push 上来的就是 ARM 架构
~~~
