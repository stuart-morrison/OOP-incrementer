# Object-oriented incrementer class

The functional programming oriented paradigm of R provides an outstanding platform for most programming problems involving data. However, due to this paradigm, it lacks a few _nice-to-haves_ of object-oriented programming - namely: class attributes in R are immutable.

This means you cannot create a class with methods that modify attributes after intialisation.

Given that creating objects that can add one to themselves is a stereotypical problem for beginner programming, I wanted to skirt R's rules to come up with a solution that works here.

My new object harnesses R's environments to skirt around R's immutable classes - in essence, using an environment where one would use a class in, say, Java.

```
test <- incrementer()

    for (i in 1:10) {
        test$up()
}

test

[1] 11

```

It harnesses methods of `up()` and `down()` increments. As well as containing functions to reset the count or output the count as a sequence.

```
for (i in test$seq()) {
    print(i)
}

[1] 1
[1] 2
[1] 3
[1] 4
[1] 5
[1] 6
[1] 7
[1] 8
[1] 9
[1] 10
[1] 11

test$reset()

test

[1] 1

```
