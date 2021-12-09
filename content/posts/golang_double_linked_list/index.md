---
title: "Go的双向链表" 
description: ""
date: 2021-12-10T00:01:30+08:00
tags: 
    - Data Structure
    - Golang 
categories: 
    - Programming 
---

Although list is rarely used in golang ([Just about always when you are thinking of a list - use a slice instead in Go](https://stackoverflow.com/a/21328187)), but there is an implementation of double linked list in standard package of golang. After reading the implementation ([go standard package: src/container/list/list.go](https://pkg.go.dev/container/list)), I found it very inspiring.

## The Node 

Basiclly, it first defines `Node`, which is referred to as `Element` in the standard package:
 
```go
type Element struct {
    prev, next Element
    list *List
    Value interface{} 
}
```

It is, actually a structure we create a lot when solving linked list problem in websites like LeetCode. The difference is:

1. One single Element simutaneously points to TWO other elements, as it is a double-linked list(or doubly linked list).
2. It has a field pointing to the list which it belongs to, which can be very convenient when we want to decide whether an element belongs to a list. 


## The List
Then the list part:

```go
type List struct {
    root Element
    len int
}
``` 

It has only two fields: a root of the list, and the length of the list. 

The interesting part of that is: The root is actually not the most front element of the list, but an empty element point to the beginning element of the list. It is the so-called **Sentinel**.


## The Sentinel Element
Sentinel is actually a very common practice when dealing with linked list. Because we usually have to do some operations like remove or insert a head node to the linked list. It can be very helpful to have a static node which we can always rely on.

But here, the sentinel is even more helpful, as it is not only pointer to the beginnig `Element` of the list, but also the ending `Element` of the list. We can conclude from following code:

```go
// Front returns the first element of list l or nil if the list is empty.
func (l *List) Front() *Element {
	if l.len == 0 {
		return nil
	}
	return l.root.next
}

// Back returns the last element of list l or nil if the list is empty.
func (l *List) Back() *Element {
	if l.len == 0 {
		return nil
	}
	return l.root.prev
}
```

Therefore considering the existence of the sentinel `Element`, we are actually having a hypothetical circle. The sentinel `Element` connect the beginning and the end of the double linked list.

We do not need to keep 2 fields to point to the beginning and the end `Element` of the list anymore, the root `Element` can handle all of these.

## What Can List Does For Us
Although as it is said at the beginning of this article, list is rarely used in golang. It can be replaced in most situations simply by `Slice`. However, I do think about one certain situation when it can be adopted: The LRU cache.

If you do not have an idea of what LRU is, please refer to [this article](https://www.interviewcake.com/concept/java/lru-cache).

So what kind of structure do we need to implement a LRU in golang?

Consider when a key is hitted in LRU, we often assume that it can be frequently accessed, so we need to move it to the front of our structure. 

On the other hand, if the capacity is full and we need to add a new key to the structure, we also need to quickly drop out the oldest key at the end of our structure.

In this situation, a double linked list can achieve the above 2 operations very effectively.

<!-- Also, considering dealing with a cache, it is better to be a  data structure to quickly peek/get what we want to find in hopefully $O(1)$ time. So a HashMap is necessary.  -->


---

If you like my article and want to make a donation, you can click the [捐赠 Donation](https://mooxiu.github.io/donate/) button on the side bar.