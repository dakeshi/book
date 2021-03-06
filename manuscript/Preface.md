# Preface
You might be reading this book because you're a developer and for a long time you've had the curiosity about **Reactive**. I had it a long time ago but every time I tried to analyze Reactive as a paradigm, I couldn't see any advantage that motivated me to change the way I had been programming until then *(mostly Imperative Programming)*.

Most of developers are used to develop in an **imperative** manner that consists of defining instructions/commands. We tell the program **what** it has to do and the execution conditions:

- Show this view.
- Download these data from the API.
- Update a view with the models that come from this data source.

> **Imperative Programming - [Wikipedia](https://en.wikipedia.org/wiki/Imperative_programming)**
> In computer science, Imperative Programming is a programming paradigm that uses statements that change a program's state. In much the same way that the imperative mood in natural languages expresses commands, an imperative program consists of commands for the computer to perform. Imperative Programming focuses on describing how a program operates.

Amongst other **reasons**, we develop in that way because the frameworks and most of resources aim to follow that style, we're surrounded by Imperative Programming. Why should I change if most of the resources, frameworks as well as Internet are imperative?

**Functional Programming allows coding with fewer potentials for bugs because each component is completely isolated**.

Later in this book I'll give more details about the advantages and disadvantages, but when you start enjoying with Reactive you'll figure out how your components APIs get simplified, and you'll feel like a baby playing with streams.

## Why Swift?

The reason for choosing Swift *(besides being a cool language, and you know it)* it's mainly because:

- **Fluent Interface**: We don't have brackets anymore, `[self setBrackets:NO]`. Back in time, with Objective-C, if we wanted to chain different operations we ended up with an unreadable code full of brackets. Some libraries had to turn to defined macros to simplify their API. Rather, with Swift we can chain operations with a simple dot and consequently [fluent interfaces](https://en.wikipedia.org/wiki/Fluent_interface) are much more readable. The concatenation of operators applied to stream data is something frequently done in Reactive, and so the importance of having this feature in the language. If we take a look at the example below we can see how different operations are chained using custom operators to get finally a *stream* result of applying these operations to the source:

{width=100%}
![Example showing the fluent interface using operators applied to the text being introduced in a UITextField](images/preface_fluent.png)

- **Custom operators:** That make even more attractive the chaining of operations. In the example above the operator `|>` is used to apply a **function** to the input stream and return another stream with the events mapped using the function. As you can see functions have a singular importance in Reactive because they'll manipulate data sent through the streams.

- **Generics and type safety:** With Objective-C it was impossible to specify the data type when you defined the stream of data. We used foundation types, `NSArray`, `NSDictionary`, `NSObject`, and the observer entities had to cast the data validating it in *execution time*. Thanks to Swift and the introduction of generics it's possible now to define that the stream source is a source of data, type X, and consequently, the data sent is of type X. The compiler tracks the types thus, your implementations are more robust.


## A book, an adventure

I don't like talking about me, but I think a bit of a context is needed to understand the reasons that drive me to this point.

My name is Pedro, in most of social networks you'll find me as **@pepibumur**. Although I'm graduated in *Telecommunication Technologies and Services* (aka Teleco), I've developed my professional activity around the software development, in particular, mobile software development, and more precisely, iOS.

In 2010, when I started the University, in Valencia, I got my first Macbook Pro. By that time I gave my first steps in programming. It wasn't Objective-C, but **C**. I remember the teacher insisting on the importance of teaching C as a programming language since most of the students didn't have any programming knowledge. He refused to teach Java or even introducing OOP without having a perfect idea of the basic programming concepts like types, functions, basic operators...

I remember my classmates suffering to finish some tasks with the most fundamental concepts in C. I wonder what would have happened if the teacher had introduced OOP...

Apart from C we also worked with other languages like **Matlab** for almost all the degree subjects and **Java** that we used for small apps that implemented telematic services like "implementing a web server", "implementing a DNS server", ... I remember hating Java as a programming language and I have to say I keep doing it.

Some months later I downloaded **Xcode** and with the help of some Internet tutorials I started with some tests in Objective-C. My first lessons around OOP were with Objective-C. I learnt the typical Apple architectural patterns. I remember the first time I read about the *Delegate* pattern and having to read it multiple times until I was able to understand what it exactly was. I also remember having to manage the *reference counting* manually before ARC was introduced. I started learning the language like if I was exploring a jungle, experimenting, trying, failing and exploring all the resources around Internet *(I also bought some books and Stackoverflow became my best friend)*.

In these first years with Objective-C I developed  some apps that are still available  the App Store but whose code can be very close to a spaghetti dish. The following years I released different apps, each one more complex than the previous one, but without focusing too much on such important points in software projects as *architecture, patterns, code organization, scalability, reusability, ...*

> If you feel curious about some of my developed apps during that period you can take a look at [my profile on the App Store](	https://itunes.apple.com/es/artist/pedro-pinera-buendia/id454075497) or if you prefer it, you can also check my [Github profile](https://github.com/pepibumur) where I've also Open Source libraries that I have worked in before.

It was in 2014 when I joined the **Redbooth** iOS team, a startup from Barcelona whose primary product was a management product for companies. It was during my year with that company where I grew a lot as a developer. I learnt things like:

- Work in teams.
- Project organization and Agile methodologies.
- The importance of architectures and code style.
- Git & Github *(I know, I fell in love a bit late, but I can't live without it now)*.
- First steps with Android *(I still remember what agonizing was leaving Objective-C to develop in Java and wait for Gradle to get the project compiled, it was the perfect time to prepare a coffee)*.

One year later I joined the project [**8fit**](http://8fit.com), being, in that case, the Mobile Lead Developer responsible of both iOS and Android projects. The project was starting, and I had a long road ahead, not only on the development side but also in teams leadership. During that time I have had the freedom to experiment and get the product close to the recent SDK improvements:

- Since the first version of **Swift** we've been introducing new components to the app 100% written in Swift. In fact, we've as a rule in the company to use Swift for future components and test them using Swift.
- Developed an app for **Apple Watch**.
- Interaction with web doing native implementations, designing the migration to a pure native approach *(as Facebook did a long time ago starting with a web product)*.

Moreover having the leader position has allowed me to grow from the organization perspective and learn a lot of skills and tricks to coordinate, manage, motivate and align human teams with the project needs.

After that year I've recently joined [**SoundCloud**](https://soundcloud.com) as iOS Engineer driven by the company culture, the incredible iOS team the company has and the opportunity to grow as a developer in a company that actively support open communities. I couldn't be more excited when they told me that they were using Reactive Programming for the architecture of their app core.

-----

I gave my first steps with Reactive in a project that I'm developing in my spare time with some friends, [**GitDo**](http://gitdo.io).

Gitdo is an application for iOS/OSX that makes easier the Github issues management thanks to a new format based on tasks management, powered notifications,  and native integration with desktop & mobile platforms. [Link](http://gitdo.io)

It was developing the **Core** of this application where I implemented the data and business logic layers using Reactive, and it was there when I realized the advantages of Reactive Programming, especially within Swift. Since then I've been applying these concepts to other projects, included 8fit and shared all my experiences, pitfalls, and learnings with a lot of developers that don't dare using it.

My dream currently is launch this project and travel around the world developing and evolving the app that helps other developers like you to centralize the software projects management in Github. With your purchase, you'll contribute to the development of this application, that I hope it's available soon. Thanks for everything and I hope that you enjoy the book as much as I did writing it for you.

## Teaching Reactive

I enjoy learning and sharing my acquired knowledge. The same way we learn from others, others will be able to learn from us. A lot of the examples around Internet show fascinating use cases but too ideal for you. You end up wondering if you'll find such a perfect case in your app. That's the moment when you can go further or stop there. I did it, and now I enjoy combining **signals** and **events** , especially now with Swift. I would like to pass on my motivation to more developers and that they/you start using **Reactive** in the projects.

I would like this book to be close to any iOS/OSX developer, so I'll offer examples of interaction not only with system Frameworks but with well-known frameworks with which we work almost daily *(Realm, Alamofire, ...)*. If after reading the book I drive you to enjoy and start using Reactive in your projects I hope you enjoy it and broadcast that knowledge to more developers, they will thank you. Remember:

- If so many concepts make you feel stressed, put the book aside and take a breath. Restart your reading later. It's crucial that you consolidate the first concepts to not getting lost with the most advanced sections of the book.
- Don't worry if in the first sections you've problems to absorb the concepts explained, they are not easy to since they require changing lightly the way we thing respect to where the data comes from and how we combine it. I'll help you to make it easier.
- If even so, it's not clear enough for you or you think it could be explained in a different way easier to understand, do not hesitate to contact me. Let's make this book a reference for developers looking forward to starting with Reactive!

**Reactiving in Swift!**
