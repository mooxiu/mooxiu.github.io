---
title: "双系统升级Win10 20H1的时候Linux引导失效修理"
description: "Unknown filesystem, entering rescue mod"
date: 2021-07-26T10:06:18+08:00
tags:
  - Dual Boot
  - Manjaro Linux
  - Win10
categories:
  - 笔记
---

## The Situation

Dual boot: Win10 and Manjaro Linux.

When trying to update Win10 to the latest Win10 20H version, after rebooting my system, it did not enter the booting interface, rather it says:

> Unknown filesystem, entering rescue mod

## First Try

After searching the internet, I find [this video](https://www.youtube.com/watch?v=a8UuIBdMh4M) shows the same problem.

However, after I `ls` my hd partion one by one on my pc, I found there are 3 partions showing they have ext2 filesystem. I think that is because they are:

- main partion for Linux
- boot partion of Linux
- swap partion

so I have to `set boot` and `set prefix` one by one and test. I typed:

```sh
set boot=(hd0,gpt7)
set prefix=(hd0,gpt)/boot/grub
insmod normal
normal
```

but they all show:

> '/boot/grub/xxx/normal.mod' not found

## Second Try

I found [another tutorial](https://www.youtube.com/watch?v=ZpIOteojORE) from the comments of the above one. And it solves my problem.

After I type `ls (hd0,gpt7)/`(notice there is a backslash), it turns out that it only have `grub/` under the partition, which means I should `set prefix` as `(hd0,gpt7)/grub` rather than `(hd0,gpt7)/boot/grub`.

It works and I successfully logged into my Linux system.

## Still Something need to be done

But when I reboot my system the problem appears again! Like the [situation in the forum](https://forum.manjaro.org/t/grub-error-unknown-file-system/28153).

Actually we should save the config, like **@Oj G** says in the comment of last video:

> then launch your linux and write it to your terminal:
> "sudo update-grub " then
> "sudo grub-install /dev/sda"
> it will save your config

It works perfect!
