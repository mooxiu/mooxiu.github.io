---
title: "How to avoid aliasing in Virtual Indexed Physical Tagged"
date: 2024-07-20T17:44:00+09:00
draft: true
tags: 
    - Virtual Memory
    - TLB
    - Cache 
categories: 
    - Computer Science 
---

The problem of VIPT(Virtual Indexed Physical Tagged) cache is that multiple virtual addresses can be mapped to the same physical address. This is not a problem for physical indexed and physical tagged cache (AKA, the standard practice), but for VIPT, the virtual address can fetch memory blocks to different caches, once a cache has been written, there's a problem of inconsistency, whcih is so-called "aliasing".

To prevent it, we can make those virtual addresses mapped to the same cache. Let's check a virtual address:

![virtual memory](./virtual%20memory.png)

From the perspective of virtual memory to physical memory translation (top side of the image): 

```
PhysicalAddr = concat(VirtualToPhysical(VPN), PageOffset)
```
Considering 2 virtual memories are mapped to the same physical memory, we know in the TLB we have:
```
VPN1 -> TLB -> PPN
VPN2 -> TLB -> PPN
```
and `PageOffset1 == PageOffset2`.


From the perspective of memory address to cache (bottom side of the image): As tag is physically tagged, we don't need to worry about tag part, we need the index to also be the same. Considering the page offset parts are the same, if we can make the index part inside of page offset part, then this condition is also satisfied:

$$len(PageOffset) >= len(index) + len(offset)$$

To make this formula more meaningful:

$$2^{len(PageOffset)} >= 2^{len(index)} \cdot 2^{len(offset)}$$
that is:

```
page size >= cache set count * cache line size
```

that is:
```
page size * associativity >= cache set count * cache line size * associativity = cache size
```

The conclusion is that we should make the cache size small enough satisfying:
```
cache size <= page size * associativity
```

The associativity means how many cache lines are there inside of a set. For direct mapping case, the associativity is 1; for full mapping case, the associativity equals to the cache line count.








---

If you like my article and want to donate, click the [捐赠 Donation](https://mooxiu.github.io/donate/) button on the sidebar.