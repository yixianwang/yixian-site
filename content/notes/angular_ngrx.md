+++
title = 'Angular NgRx'
date = 2024-09-04T19:21:00-04:00
+++

- [Tips](https://dev.to/this-is-angular/ngrx-tips-i-needed-in-the-beginning-4hno)

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

## combineLatest
```ts
import { Component, OnDestroy, OnInit } from '@angular/core';
import { combineLatest, Subject } from 'rxjs';
import { StoreA } from '../store-a/store-a.service';
import { StoreB } from '../store-b/store-b.service';
import { takeUntil } from 'rxjs/operators';

@Component({
  selector: 'app-example',
  templateUrl: './example.component.html',
  styleUrls: ['./example.component.scss']
})
export class ExampleComponent implements OnInit, OnDestroy {
  private destroy$ = new Subject<void>();

  dataA$ = this.storeA.data$; // Observable from StoreA
  dataB$ = this.storeB.data$; // Observable from StoreB

  combinedData: any; // Combined data from both stores

  constructor(private storeA: StoreA, private storeB: StoreB) {}

  ngOnInit(): void {
    // Example of combining streams for component logic
    combineLatest([this.dataA$, this.dataB$])
      .pipe(takeUntil(this.destroy$))
      .subscribe(([dataA, dataB]) => {
        this.combinedData = { dataA, dataB };
        console.log('Combined Data:', this.combinedData);
      });
  }

  ngOnDestroy(): void {
    this.destroy$.next();
    this.destroy$.complete();
  }
}
```

```html
<div *ngIf="dataA$ | async as dataA">
  <p>Data from Store A: {{ dataA | json }}</p>
</div>
<div *ngIf="dataB$ | async as dataB">
  <p>Data from Store B: {{ dataB | json }}</p>
</div>
```

### More Example
```ts
import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable, combineLatest } from 'rxjs';
import { map } from 'rxjs/operators';
import { loadUsers } from './store/user.actions';
import { selectUsers, selectUsersLoading, selectUsersError } from './store/user.selectors';

@Component({
  selector: 'app-users',
  template: `
    <div *ngIf="loading">Loading...</div>
    <div *ngIf="error">{{ error }}</div>
    <ul *ngIf="processedUsers.length > 0">
      <li *ngFor="let user of processedUsers">{{ user.name }}</li>
    </ul>
    <div *ngIf="!loading && processedUsers.length === 0">No users found.</div>
  `,
})
export class UsersComponent implements OnInit {
  loading = false;
  error: string | null = null;
  processedUsers: { id: string; name: string }[] = [];

  constructor(private store: Store) {}

  ngOnInit(): void {
    this.store.dispatch(loadUsers());

    // Combine streams for business logic
    combineLatest([
      this.store.select(selectUsers),
      this.store.select(selectUsersLoading),
      this.store.select(selectUsersError),
    ])
      .pipe(
        map(([users, loading, error]) => {
          this.loading = loading;
          this.error = error;

          // Apply business logic here
          if (users) {
            return users.filter(user => user.isActive); // Example business logic: Filter active users
          }
          return [];
        })
      )
      .subscribe((processedUsers) => {
        this.processedUsers = processedUsers;
      });
  }
}
```

## if-else in subscribe block
- If the logic is straightforward and doesn't involve too many nested conditions, it's acceptable.
```ts
subscribe(([dataA, dataB]) => {
  if (dataA && dataB) {
    this.combinedData = { dataA, dataB };
  } else {
    console.error('Missing data');
  }
});
```

- Move the conditional logic to operators like filter, map, or switchMap before the subscribe block.
```ts
combineLatest([this.dataA$, this.dataB$])
  .pipe(
    takeUntil(this.destroy$),
    filter(([dataA, dataB]) => !!dataA && !!dataB), // Ensure both exist
    map(([dataA, dataB]) => ({ dataA, dataB })) // Transform data
  )
  .subscribe(combinedData => {
    this.combinedData = combinedData;
    console.log('Combined Data:', combinedData);
  });
```

- Extract complex logic into a separate method.
```ts
subscribe(([dataA, dataB]) => {
  this.processData(dataA, dataB);
});

processData(dataA: any, dataB: any): void {
  if (dataA && dataB) {
    this.combinedData = { dataA, dataB };
  } else {
    console.error('Missing data');
  }
}
```

## combineLatest
- `combineLatest([observable1, observable2, ...]): Observable<[T1, T2, ...]>`
- It waits until each of the source observables has emitted at least one value.

## Behavior Subject
```ts
import { combineLatest, BehaviorSubject } from 'rxjs';

const filter$ = new BehaviorSubject<string>('active'); // Emits "active"
const sort$ = new BehaviorSubject<string>('name');    // Emits "name"

// Combine the latest values
combineLatest([filter$, sort$]).subscribe(([filter, sort]) => {
  console.log(`Filter: ${filter}, Sort: ${sort}`);
});

// Output:
// Filter: active, Sort: name

// Updating streams
filter$.next('completed');
// Output: Filter: completed, Sort: name

sort$.next('date');
// Output: Filter: completed, Sort: date
```

## EntityState for CRUD operations
```ts
import { EntityState, EntityAdapter, createEntityAdapter } from '@ngrx/entity';

export interface Todo {
  id: string;
  title: string;
  completed: boolean;
}

export interface TodosState extends EntityState<Todo> {}

export const adapter: EntityAdapter<Todo> = createEntityAdapter<Todo>();

export const initialTodosState: TodosState = adapter.getInitialState();
```

## Partial for states that are populated after an API call
- Use Partial or Lazy Initialization When Necessary
- For very large or complex state, you can use Partial<T> to initialize only top-level properties and lazy-load the deeper ones as needed. This can be useful for states that are populated after an API call.
```ts
export interface DeepComplexState {
  topLevel: string;
  deeplyNested: {
    level1: {
      level2: {
        value: string;
      };
    };
  };
}

export const initialDeepComplexState: Partial<DeepComplexState> = {
  topLevel: '',
  deeplyNested: undefined, // Initialize later when necessary
};
```

## Avoid any
- Avoid any in favor of type-safe solutions like Partial, Record, or EntityState.

## logger for signal store
- The following example shows how to create a custom feature that logs SignalStore state changes to the console.
```ts {filename="logger.feature.ts"}
content_copy
import { effect } from '@angular/core';
import { getState, signalStoreFeature, withHooks } from '@ngrx/signals';

export function withLogger(name: string) {
  return signalStoreFeature(
    withHooks({
      onInit(store) {
        effect(() => {
          const state = getState(store);
          console.log(`${name} state changed`, state);
        });
      },
    })
  );
}
```

- The withLogger feature can be used in the BooksStore as follows:
```ts {filename="book.store.ts"}
import { signalStore } from '@ngrx/signals';
import { withEntities } from '@ngrx/signals/entities';
import { withRequestStatus } from './request-status.feature';
import { withLogger } from './logger.feature';
import { Book } from './book.model';

export const BooksStore = signalStore(
  withEntities<Book>(),
  withRequestStatus(),
  withLogger('books')
);
```
- State changes will be logged to the console whenever the BooksStore state is updated.

## Entity Management
- The entityConfig function reduces repetitive code when defining a custom entity configuration and ensures strong typing. It accepts a config object where the entity type is required, and the collection name and custom ID selector are optional.
```ts
import {
  patchState,
  signalStore,
  type,
  withMethods,
} from '@ngrx/signals';
import {
  addEntity,
  entityConfig,
  removeEntity,
  withEntities,
} from '@ngrx/signals/entities';

type Todo = {
  key: number;
  text: string;
  completed: boolean;
};

const todoConfig = entityConfig({
  entity: type<Todo>(),
  collection: 'todo',
  selectId: (todo) => todo.key,
});

export const TodosStore = signalStore(
  withEntities(todoConfig),
  withMethods((store) => ({
    addTodo(todo: Todo): void {
      patchState(store, addEntity(todo, todoConfig));
    },
    removeTodo(todo: Todo): void {
      patchState(store, removeEntity(todo, todoConfig));
    },
  }))
);
```

## Manual Cleanup signalMethod created in an ancestor injection context
```ts
@Injectable({ providedIn: 'root' })
export class NumbersService {
  readonly logDoubledNumber = signalMethod<number>((num) => {
    const double = num * 2;
    console.log(double);
  });
}

@Component({ /* ... */ })
export class NumbersComponent implements OnInit {
  readonly numbersService = inject(NumbersService);
  readonly injector = inject(Injector);

  ngOnInit(): void {
    const value = signal(1);
    // 👇 Providing the `NumbersComponent` injector
    // to ensure cleanup on component destroy.
    this.numbersService.logDoubledNumber(value, {
      injector: this.injector,
    });
  
    // 👇 No need to provide an injector for static values.
    this.numbersService.logDoubledNumber(2);
  }
}
```