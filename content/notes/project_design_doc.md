+++
title = 'Project Design Doc'
date = 2024-06-24T22:33:18-04:00
+++

## Guide
- please write down design document for your most recent project, including:
   1. features / functionalities  / system purpose + overview
   2. database schema (tables)
   3. high level design (microservice architecture) and provide module pictures
   4. rest api design (design 2 - 4 rest apis)
   5. Data flow, prepare 2 - 3 data flow diagram (example: when user client some buttons to upload some files, what happens next, how does request go through your service

## Design Doc of eBay project - Data Analytics Dashboard
### 1. Features / Functionalities / System Purpose + Overview


## Dashboard
### Requirements
- there is an analytical dashboard
- it has a ton of widgets

### Out of Scope
- write operations
  - there may have been some kind of "generate report" button

### Numbers
- 1000 TPS reads


### Approaches
#### Rendering approaches:
- client-side rendering
   - Pros:
      - less complex
   - Cons:
      - higher latency

- server-side rendering
   - Pros:
      - faster page loads (lower latency)
   - Cons:
      - duplicated rendering logic
      - could be bandwidth bound

- JSON blob side-load rendering, of all the data approach
   - Pros:
      - still fairly faster page loads (lower latency)
      - no duplication of rendering logic
   - Cons:
      - might be a little more complex

#### Data fetching approach:
   - Non-aggregated
      - Pros:
         - stronger consistency
      - Cons:
         - tail end latency amplifications
         - eventual consistency
   - Pre-aggregated
      - Pros:
         - probably faster page load times (you don't depend on the response times of upstream services)
      - Cons:
         - eventual consistency
   - Sometimes we can do both

#### Widget decoupling strategy

### AGENDA
- client side rendering
   1. get index.html shell file
   2. retrieve assets from CDN
   3. make a bunch of back-end calls

- client side rendering
   1. get index.html
   2. retrieve assets from CDN
   3. make a call to aggregated endpoint

- server-side rendering
   1. call comes into the back-end server
   2. either pre-cached data OR a bunch of API calls
   3. return the pre-rendered HTML

- JSON blob side-load rendering approach
   1. call comes into the back-end server
   2. either pre-cached data OR a bunch of API calls
   3. return a shell index.html file with an attached JSON blob
   4. pull assets from CDN

#### Widget decoupling strategy



### Live discussion questions
- Hey, do you follow the book "System Design Interview" by Lewis Len?
   - Yes, I do have that book! :) I like Stanley Chiang's too

- is the pre cached data and cdn for historical data? i thought dashboards usually refresh at a frequent rate to get new data from the backend?
   - depends on how stale that data can get



would depends on what kind of charts are we looking. Say for stock ticker, it would send data through push/socket and asks application/client to update data in chart itself



For static charts(updates once a day or so), cdn would help just like bundled js



SEO capability — Since the page load happens in server side, it is easier for the SEO crawlers to search, explore content and index the pages.






The equivalent of this in the industry is - "Design Grafana" ?




I think CDN would be needed in case there's some video/giphy? Otherwise response would be kind of big



If its hosted within an iFrame, then a CDN is still required to perform filters, slicing on SSR payload?


CDN will host the js bundles which has the slicing functions




what is the difference between the last one and pre-aggregated, server side rendering?

- pre-aggregated, server side rendering
  uses a cache

- the last one (the side-loaded JSON blob)
  does not use a cache (for stronger consistency)





Did we discuss the tech for caching store and data layout, etc.?
Thanks! :)



In interview were you given specific info whether you want to design real time/static dashboard, non predictable dashboard?
You should clarify that with the interviewer for sure -- whether stale data is tolerated






I personally used MongoDB as aggregated cache using _id. Worked with way less $$ than redis
"caching"



1) How to handle streaming data say for a time chart?
   that might require a socket -- for continuous updating without resfreshing the page
   if page refreshes are fine, you can just have more fresh data from not not passing that data throught the caching data store

2) If alerting is in scope - for breaching thresholds, at what layer should the alert rules be stored?
   alerts do not come from dashboard



what's in schemaless_JSON_blob? states of widget?
anything you want, possibly in ion format





where the aggregated data aggregated stored ?
DynamoDB / MongoDB



For the Hybrid approach, what is the purple color rectangle in your diagram?


or it is that front end will call aggregated data service which would call the service a , b apis




@Jitendra Vyas hmm why don't we use MQ here? Can service push msg to MQ and then the "some task runner" service push data to cache?





Or other approach is "some task runner" is like a cronjob, and it will runs for every 5 mins?




you're right actually. That purple box is blackbox here to state purpose of there's some event that says there's data update in system






what messages are store inside the purple msg broker kafka?






ny relevant info, new aggregated data available in system








how can we integrate real time data capturing elements like web sockets or sse?



hmm so can service A, B, C push to mq and then "some task runners" will consume it?





i mean push data to UI instead of pull






For the hybrid approach, I see you combine both the pre-aggregate and non-aggregate. Suppose that we have a client request, how can we decide which way should we do?
it does both






What does the js bundle for the CDN widget for each service have?
```
{
    user1234_configA: {
        lineChartWidget: "{
            lineData: [5,6,9,2]
        }",
        pieChartWidget: "{
            sessionMap: {
                email: 982
                social: 968
                display: 910
            }
        }",
        tableWidget: "{
            //
        }"
    }
}
```



## Notes
We had a ton of Upstream dependencies which kind of is analogous to having a bunch of different widgets.
Each widget required like different API call.

Rendering the page, it might take a dozen of API calls.
Then we are susceptible to the problem that DDIA was called tail end latency amplification?.
> Tail latency amplification is a phenomenon that increases the impact of long delays by making all requests that arrive during a period of time more likely to experience latency.

