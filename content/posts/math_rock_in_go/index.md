---
title: "Understanding Relationship of Math Rock, Mid-Western Emo, Prog Metal, etc"
description: "From A Golang Programmer's Perspecticve"
date: 2022-01-07T22:29:21+08:00
tags: 
    - Music
    - Math_Rock 
categories: 
    - Music
    - 空谈 
---

I am really confused about the relationship among following genres:
- Math Rock
- Mid Westen Emo
- Progressive Metal
- Post Rock

I mean, when people talking about math-rock, they tend to mention *mid-western emo* chord, blabla. I'm getting more and more lost in those conceptions, however I begin to get things into shape when I think about this problem in a programming way.

So here is the result from **My Own Understanding**:
```go
type Rock interface {
	// ... so many things to write
}

type MathRock interface {
	Rock
	TooManyTapping()
	BaicallyInstrumental()
	TooManyOddTimeSignature()
}

type PostRock interface {
	Rock
	BasicallyInstrumental()		
}

type MidWesternEmo struct {
}

type ProgMetal struct {
}


// Here are some example:
struct AmericanFootball struct {
	// Embed mid western emo struct 
	MidWesternEmo
}

// Implements all the Math Rock Method
func (a *AmericanFootball) TooManyTapping() {}

func (a *AmericanFootball) BasicallyInstrumental() {}

func (a *AmericanFootball) TooManyOddSignature() {}

// Implements all Rock methods...


```


What can we conclude from code above:
1. Math Rock can be treated as Post Rock, as it impelments all methods of the later one.

2. Gernes lik *emo* or *prog metal* are more eccentric to the band, thus should be regarded as `struct`s. If one prog band implements all the math rock methods, that is **playing music in a math rock way**, it should also be regarded as a math rock band.

3. Same thing with `Blues` and `Jazz`. In this case, Blues should be `struct` and `Jazz` is an interface. You can play Blues in a Jazz way, then you are both *Blues* and *Jazzy*. But you can also play `Classical` in a Jazz way, then you are both *Classical* and *Jazzy*, as **Keith Jarrett** does.
---

If you like my article and want to make a donation, you can click the [捐赠 Donation](https://mooxiu.github.io/donate/) button on the sidebar.
