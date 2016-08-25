---
title: kgraft to Patch Ubuntu Kernel without Reboot
author: riesal
layout: post
date: 2016-08-25T15:06:28+00:00
url: /2016/08/kgraft-to-patch-ubuntu-kernel-without-reboot/
dsq_thread_id:
  - 4823539600
categories:
  - Business
tags:
  - kernel
  - linux
  - ksplice
  - kgraft
  - live patch
  - kernel patch
---

**It is simply how to allow kernel swap without needing reboot.**

> Article by: [arges](http://dinosaursareforever.blogspot.co.id/)

New live kernel patching projects have hit LKML recently[ \[1\]](https://lkml.org/lkml/2014/4/30/477)[\[2\]](https://lkml.org/lkml/2014/5/1/273), and I've taken the opportunity to test drive kGraft with the Ubuntu kernel. This post documents how to get a sample patch working.

<span id="more-4512"></span><!--more-->

A Simple Example
First, I had to take the patches from [ \[3\]](https://git.kernel.org/cgit/linux/kernel/git/jirislaby/kgraft.git/) and apply them against the ubuntu-utopic kernel, which is based on 3.15-rc8 as of this post. They cherry-picked cleanly and the branch I'm using is stored here [ \[4\]](http://zinc.ubuntu.com/git?p=arges/ubuntu-utopic.git;a=shortlog;h=refs/heads/kgraft-utopic). In addition to applying the patches I had to also enable CONFIG_KGRAFT. A pre-built test kernel can be downloaded here [ \[5\]](http://people.canonical.com/~arges/kgraft-utopic/).

Next, I created a test VM and installed the test kernel, headers, and build dependencies into that VM and rebooted. Now after a successful reboot, we need to produce an actual patch to test. I've created a github project [ \[6\]](https://github.com/arges/kgraft-examples) with the sample patch; to make it easy to clone and get started.

    sudo apt-get install git build-essential
    git clone https://github.com/arges/kgraft-examples.git
    cd kgraft-examples
    make

The code in kgraft_patcher.c is the example found in samples/kgraft [7]. Now we can build it easily using the Makefile I have in my project by typing make.

Next, the module needs to be inserted using the following:

    sudo insmod ./kgraft_patcher.ko

Run the following to see if the module loaded properly:

    lsmod | grep kgraft

You'll notice some messages printed with the following:

> [  211.762563] kgraft_patcher: module verification failed: signature
> and/or  required key missing - tainting kernel [  216.800080] kgr
> failed after timeout (30), still in degraded mode [  246.880146] kgr
> failed after timeout (30), still in degraded mode [  276.960211] kgr
> failed after timeout (30), still in degraded mode

This means that not all processes have entered the kernel and may not have a "new universe" flag set.  Run the following to see which processes still needs to be updated.

    cat /proc/*/kgr_in_progress

In order to get all processes to enter the kernel sometimes a signal needs to be sent to get the process to enter the kernel.

An example of this is found in the kgraft-examples [6] called 'gethurry.sh':

    #!/bin/bash
    for p in $(ls /proc/ | grep '^[0-9]'); do
      if [[ -e /proc/$p/kgr_in_progress ]]; then
        if [[ `sudo cat /proc/$p/kgr_in_progress` -eq 1 ]]; then
         echo $p;
         sudo kill -SIGCONT $p
        fi
      fi
    done

Here is checks for all processes that have 'kgr_in_progress' set and sends a SIGCONT signal to that process. 

I've noticed that I had to also send a SIGSTOP followed by a SIGCONT to finally get everything synced up.

Eventually you'll see:

> [ 1600.480233] kgr succeeded

Now your kernel is running the new patch without rebooting!
