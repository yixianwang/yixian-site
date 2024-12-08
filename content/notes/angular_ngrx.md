+++
title = 'Angular NgRx'
date = 2024-09-04T19:21:00-04:00
+++


- [Youtube](https://www.youtube.com/watch?v=kx0VTgTtSBg)

## Pros
- The component shouldn't have to worry about how to manage the state when something happens.
- It doesn't need to know what services to inject or methods to call to get the job done.


## Work flow
1. A **component** dispatches an **action** to indicate that something happened.
2. The part of our application actually responsible for determining how **actions** should modify state are the **reducers**.
3. **Reducers** detect all of the **actions** being dispatched in the app and determine how the state should be modified as a result.
4. Usually we would have a **reducer** for each feature or entity in the app.
5. **Reducers** detect the **action**, take the current state and store the new state in the **store**.
6. So the **store** which is often global is where all of the state for our application lives.
7. **Store** is really just one big object full of data.
8. When a **component** wants to use some of that state from the **store**. **Component** can use a **selector** to pull in the state that it needs from the **store**.
9. **Effects**, an important concept is that **effects** reduces the functions that take in an **action** and create a new state are **pure functions**. That means two thing:
   1. Given the same input, they will always produce the same output.
   2. Pure functions should also not create any side effects.

> So when an **action** is dispatched, it needs to be immediately handled by the **reducer**. 
> And the state will be changed based on just the data immediately available to that **action**.
> That means for us is that when we dispatch an action, we need to give it all of the data that the **reducer** needs to make the state modification immediately.
> We cannot be making asynchronous calls to go load in data from a server for example.

> If we want to load some data into the application and add it to the **store**.
> We might need to do this with some asynchronous operation that's going to call a service that's going to load in some data from some API somewhere, and that's going to take sometime to complete. This is where **effects** come into play.
> Like a **reducer**, an **effect** can also listen to all of the **actions** being dispatched in the app.
> But unlike a **reducer**, that has to be a **pure function** intended just to update the state. 
> An **effect** can run whatever side effects it likes. 
> In the case of loading data, we would first dispatch an **action** like load todos, this will be immediately handled by the **reducer**, but we don't have the data we need yet. Because we need to make a call to the service to load the data.
> So all the **reducer** will do in response to that load todo **action**, is do something like set a flag in the **store**, changing the status of the todo state to loading or something like that.
> However, our **effect** will also be listening for that load todo **action**.
> And when it detects this, it will go off and fetch the todo from the **service**.
> And once that data has finished loading, it will dispatch a new **action**, either load todo success or load todo failure.
> Now the **reducer** can handle this load todo success **action** that was just dispatched from our **effect**.
> And this time the **action** already has all of the data available to it.
> And so now the **reducer** can set that status flag to success or something similar and it can update the todo's property in the **store** with the data we just loaded.


## Concepts
1. **Store**, this is where our data is stored & managed.
2. **Component**, this is where the data is needed & updates should be reflected.
3. **Selector(Optional)**, Component can _read data_ from the store("listen to changes).
4. **Action**, Standardized messages("events") to which reducers can listen. *Describe the changes that should be performed + any extra data that might be needed.*
5. **Reducer**, Contains state changing logic. e.g. increment counter by 1. *it have the actual logic that gets triggered based on those actions*
6. **Effects**, Side-effects that should be triggered for certain actions. e.g. send HTTP request.

## Install NgRx
`ng add @ngrx/store`

### Module
```ts {filename="app.module.ts"}
import { StoreModule } from '@ngrx/store';

// ...
   imports: [..., StoreModule.forRoot({}, {})];
```

### Standalone
```ts {filename="main.ts"}
import { provideStore } from '@ngrx/store';

bootstrapApplication(AppComponent, {
   providers: [provideStore()] // added providedStore()
});
```

## syntax
1. `createAction` + `createReducer`
