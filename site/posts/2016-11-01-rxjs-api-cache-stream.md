---
title: RxJS - Stream of cached API Responses
subtitle: 
date: 2016-11-01
author: Max A
---

<section>

I've been spending a *lot* of time in the frontend recently, trying to catch up with the year-ish worth of developments I haven't been trully involved in. I've been going through React, Redux, and RxJS in earnest over the last serveral weeks. I think particularly, making RxJS do things I wanted it to do has been a bit frustrating to me since some situations require a clumsy and workaround-ish setup for them to work within the Observable -> Observer paradigm. Maybe it's just a matter of getting used to the RxJS way? Not sure. Here's a small example:

On this [intro to RxJS](https://xgrommx.github.io/rx-book/content/guidelines/introduction/index.html), Andre Staltz makes a small user suggestion widget from the GitHub API. It's nifty in that there are no `while` or `if` statements - just pure Observer patterns. The use case is to query from the API and store the result, since there's about 30 returned users and if we dismiss a user we'd like to use the cached request from our API call.

One proposed solution is to call `combineLatest` on two streams, which returns the latest two emissions from two Observables. This, in effect, queries the latest API response while serving up the actual response on a click event. However, this does not take into account consuming the actual users and querying for more when we are out of new users. I tried (and believe me, I tried) to look around for a good, straightforward solution in the RxJS way - but did not find a clean answer. `controlled()` won't get us what we need, as it just finishes if generated off of the response. Actually, in one [SO post](http://stackoverflow.com/questions/30391212/call-api-repeatedly-until-entire-data-has-been-is-downloaded-data/30427848#30427848) Andre answers a similar question, suggesting to use Subjects as some sort of "callback" to trigger a data fetch based on a condition.

Now we're getting somewhere. If we can somehow signal back to our API stream that we need more data when we run out of users, the cycle is complete! My issue is I was trying to generate the Observer from the resulting API array - whereas most other solutions keep the Array intact, and just iterate through it, keeping track of the index again.

The final break came in my [SO post](http://stackoverflow.com/questions/40348748/rxjs-consume-api-output-and-re-query-when-cache-is-empty/40359622#40359622) and a solution that makes the **array index** the stream! Brilliant. Not quite flexible with arrays of variable length, but that was the inspiration I needed. Ultimately, all I needed to do was keep the index supplied by `map()` at hand, and just ask for another API call when I was out of bounds in my array. Solution below and [fiddle](https://jsfiddle.net/ctk2bhah/5/) for reference.

RxJS is really proving to be tricky, but we *might* just get along after all.

```{.javascript .numberLines}
var refreshButton = document.querySelector('#main');
var refreshClickStream = Rx.Observable.fromEvent(refreshButton, 'click');

var proxyStream = new Rx.Subject();
var requestStream = new Rx.Observable
    .just('startup')
    .merge(proxyStream)
    .map(function() {
        var randomOffset = Math.floor(Math.random() * 5000);
        return 'https://api.github.com/users?since=' + randomOffset;
    });

var responseStream = requestStream.flatMap(function(requestUrl) {
    return Rx.Observable.fromPromise(fetch(requestUrl));
}).flatMapLatest(function(response) {
    return Rx.Observable.fromPromise(response.json());
});

var userOutputStream = Rx.Observable.combineLatest(
    responseStream,
    refreshClickStream,
    function(users) {
        return users;
    }
);

var controlStream = userOutputStream.map(function(users, i) {
    var index = i % users.length;
    if (!users[index + 1]) proxyStream.onNext('query');
    return users[i % users.length];
});

controlStream.subscribe(function(user) {
    console.log(user)
});
```

</section>
