+++
title = 'Angular'
date = 2024-01-27T02:54:24-04:00
+++

## How to read source code in Github

## Node and Angular Version Control

### Check Current Angular and Node.js Versions

```
node -v
ng version
```

### Upgrade or Downgrade Angular

```
ng update @angular/cli @angular/core
```

```
npm uninstall @angular/cli @angular/core
npm install @angular/cli@12 @angular/core@12
```

### Reinstall Node Modules

- After upgrading or downgrading Angular, it’s a good practice to remove the node_modules folder and reinstall
  dependencies to ensure everything works with the new version:

```
rm -rf node_modules
npm install
```

## Concepts

### template reference variable

- Useful: child component can interact with or manipulate the parent's HTMLElement

```
<input #text />
<app-child [inputRef]="text"></app-child>
```

> child component use `@Input` to receive the reference of HTMLInputElement

### dynamic properties vs dynamic attributes

- dynamic attributes:
   - for custom HTML attributes which are not standard DOM properties
   - we need to prepend the custom HTML attribute with the `attr.` prefix.

```
<button [attr.data-test-id]="testId">Primary CTA</button>
```

> the declared value in square bracket should be interpreted as a Javascript-like statement.

### event

- syntax: `(click)="save()"`, interpreted as event trigger the Javascript-like statement.

## 1. Google Official Youtube Tutorial

- [Tutorial](https://www.youtube.com/watch?v=UnOwDuliqZA&list=PL1w1q3fL4pmj9k1FrJ3Pe91EPub2_h4jF&index=2)

```
# install angular
npm install -g @angular/cli
```

### new project

```
ng new project-name
cd project-name
ng serve
```

### Tutorial Project

- [Github](https://github.com/angular/codelabs/tree/homes-app-start)

```
# setup
cd homes-app
npm install
ng serve

# generate component
ng generate component Home --standalone --inline-template
```

### switch angular version

```
npm uninstall -g @angular/cli
npm cache verify

# if the there is any issue
npm cache clean --force

# install the older version of angular
npm install -g @angular/cli@8.3.19
```

## 2. Youtube Tutorial 2024

- `ng generate component home`
- `ng generate service services/api`

### Fetching Data From Server (Services & Endpoints)

## 3. Todo List Project

### build file structures of project

```
ng g s services/api
ng g c components/home
ng g class models/Todo
```

### setup bootstrap

```html {filename="src/index.html"}
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>TodolistFrontendAngular12</title>
    <base href="/">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <!-- Bootstrap setup -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">
<app-root></app-root>
<!-- Bootstrap setup -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
```

### Coding

```ts {filename="src/app/models/todo.ts"}
export class Todo {
  id?: number = 0;
  text: string = '';
  isComplete: number = 0;
}
```

```ts {filename="src/app/app.components.html"}
<app-home></app-home>
```

```ts {filename="src/app/app.module.ts"}
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

// manually added
import { HttpClientModule } from '@angular/common/http'

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './components/home/home.component';
import {FormsModule} from "@angular/forms";

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,

    // manually added
    FormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
```

```ts {filename="src/app/services/api.service.ts"}
import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  serviceURL: string;

  constructor(private http: HttpClient) {
    this.serviceURL = "http://localhost:8080";
  }
}
```

- search `input group` in bootstrap doc website

```ts {filename="src/app/components/home.component.html"}
<div class="container-fluid bg-light">
  <div class="container bg-light">
    <div class="row mt-4" style="height: 500px">
      <div class="col"></div>
      <div class="col-md-6 bg-white shadow">
        <div class="card bg-warning mt-4">
          <h4 class="text-white ps-3 pt-2 pb-2">Todo List</h4>
        </div>
        <div class="shadow">
          <div class="input-group p-4">
            <input type="text" class="form-control" placeholder="Enter todo ">
            <button class="btn btn-outline-success" type="button">Add</button>
          </div>
        </div>

        <h4 class="text-primary mt-4">Task: </h4>

        <div style="overflow-y: auto; height: 350px">
          <div class="m-3">
            <div class="p-2 shadow border">
              <div class="input-group row ps-3">
                <div class="card col-md-8 border-0">Test text</div>
                <div class="btn btn-outline-primary col me-2">Edit</div>
                <div class="btn btn-outline-danger col">Delete</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col"></div>
    </div>
  </div>
</div>
```

- back to service, add some **methods**

```ts {filename="src/app/service/api.service.ts"}
import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import { Todo } from '../models/todo';
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  serviceURL: string;

  constructor(private http: HttpClient) {
    this.serviceURL = "http://localhost:8081/reminders";
  }

  // add some methods
  addTodo(todo: Todo): Observable<Todo> {
    return this.http.post<Todo>(this.serviceURL, todo);
  }
  getAllTodos(): Observable<Todo[]> {
    return this.http.get<Todo[]>(this.serviceURL);
  }
  deleteTodo(todo: Todo): Observable<Todo> {
    return this.http.delete<Todo>(`${this.serviceURL}/${todo.id}`);
  }
  updateTodo(todo: Todo): Observable<Todo> {
    return this.http.put<Todo>(this.serviceURL + `/${todo.id}`, todo);
  }
}
```

- inject service into home component, and then define some variables and methods

```ts {filename="src/app/components/home.component.ts"}
import { Component, OnInit } from '@angular/core';
import {ApiService} from "../../services/api.service";
import {Todo} from "../../models/todo";
import {Observable} from "rxjs";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  todoObj: Todo = new Todo();
  todoList: Todo[] = [];
  addTodoText: string = '';

  constructor(private apiService: ApiService) { }

  ngOnInit(): void {
    this.todoObj = new Todo();
    this.todoList = [];
    this.getAllTodos();
  }

  addTodo(todo: Todo) {
    this.apiService.addTodo(todo).subscribe(res => {
      this.ngOnInit();
    }, err => {
      alert(err);
    });
  }

  getAllTodos() {
    this.apiService.getAllTodos().subscribe(res => {
      this.todoList = res;
    }, err => {
      alert("Unable to get todo list.");
    });
  }

  updateTodo(todo: Todo) {
    this.apiService.updateTodo(todo).subscribe(res => {
      this.ngOnInit();
    }, err => {
      alert("Unable to update todo.");
    });
  }

  deleteTodo(todo: Todo) {
    this.apiService.deleteTodo(todo).subscribe(res => {
      this.ngOnInit();
    }, error => {
      alert("Unable to delete todo.");
    });
  }
}
```

- focus on `home.component.html` and `home.component.ts`
- `name="todo"`
- bind `[(ngModel)]="addTodoText"`
- update `home.component.ts`:
- add `*ngFor="let todo of todoList"`
- add click handlers
- search `Modal` in bootstrap doc, and update parts
- add variable within `.ts` file, `updateTodoText: string = '';`

## Advanced topics

- input vs ng-content(simple string vs different html mark up)

- `<ng-content select="input, textarea” />`

- only extend built-in element like `button[buttonAttribute]`

- :host (host element)


- ? how to check setInterval running in background

- `private interval?: ReturnType<typeof setInterval>;`
- `clearTimeout(this.interval);`

Form:
get value:

1. two way binding
2. template variable(pros: not update on every keystroke behind the scenes)
   1. onSomthing(template variables) // with event
   2. viewChild(class name | template vraibel name string) // without event
   @ViewChild(‘form’) private form?: ElementRef<HTMLFormElement>;
   // or private form = viewChild.required<ElementRef<HTMLFormElement>>(ButtonComponent); // 17.3 or after // return a
   signal
   // constructor cannot access form

   this.form?.nativeElement.reset(); // executing after ? if this.form is not undefined.

- `ContentChild` vs `ViewChild`
- (ng-content child vs real exist child)


- `@ViewChild` cannot used in `ngOnInit` but can be used in `ngAfterViewInit` and other method triggers within template.


1. `@Output() add = new EventEmitter<{title: string; text: string}>();`
2. `add = output<{title: string; text: string}>();`

- private el = inject(ElementRef); // inject host element

1. `@ContentChild('input') private control?: ElementRef< HTMLInputElement | HTMLTextAreaElement >;`
2. `private control = contentChild<ElementRef<HTMLInputElement | HTMLTextAreaElement>>('input');`


1.

```
host: {
  class: 'control',
  '(click)': 'onClick()',
},
```

2. `@HostBinding('class') className = 'control';`
3. `@HostListener('click') onClick() { console.log('Clicked!'); }`

```
@for (ticket of tickets; track ticket.id) {
   <li>
      <app-ticket /> 
      {{ $first }}
      {{ $last }}
      {{ $even }}
      {{ $odd }}
      {{ $count }}
   </li>
} @empty {
   <p>No tickets available.</p>
}
```

- signal: read once in .ts file
   - signal()
- signal: set subscription in .ts file
   - effect((cleanUp) => {});


- signal: set vs update
   - signal.update((oldValue) => newValue);

- ... operator in js: keep old properties, and overriding status key.

```
this.tickets = this.tickets.map((ticket) => {
   if (ticket.id === id) {
      return { ...ticket, status: 'closed' }
   }
   return ticket;
});
```

- in template, dynamically bind css style, true/false

```
 <div
   [class]="{
     'ticket-open': data().status === 'open',
     'ticket-closed': data().status === 'closed'
   }"
 ></div>
```

// {} is configuration

- input configuration difference in input vs input.require
   - (null, {}) vs ({})
- `@Input configuration`
   - `@Input({})`

// how to setup configuration for input

1. alias(avoid in best practice), inside component is just property name, outside use alias name
2. `transform: (inputValue) => {// some transformed value}`

// how to configuration for output

1. only has alias

- `@Output('aliasNameOutsideOfComponent')`
- `propertyName = output({alias: 'aliasNameOutsideOfComponent'})`

- we can unlock ngModule with FormModule, for two-way-binding

- two-way-binding can use signal or non-signal properties

- To make component two-way-bindable
  // approach 1: version < 17.2

```
export class RectComponent{
  @Input({required: true}) size!: { width: string; height: string };
  @Output() sizeChange = new EventEmitter<{ width: string; height: string }>(); // must follow name rule here
  
  onReset() {
    this.sizeChange.emit({
      width: '200',
      height: '100'
    });
  }
}

// in parent template
<app-rect [(size)]="rectSize" />
```

// approach 2: version >= 17.2

```
export class RectComponent{
  size = model.required<{ width: string; height: string }>();
  
  onReset() {
    // we can use set or update here
    this.size.set({
      width: '200',
      height: '100'
    });
  }
}
```

- attribute vs strutural directive
   - only change the behavior of the element
   - change the structure of DOM

- window.confirm("Do you want to leave the app?");

- event.preventDefault();

- typescript type casting
   - const address = (event.target as HTMLAnchorElement).href

- queryParam = input('myapp', { alias: 'appSafeLink' });

- export type Permission = 'admin' | 'user' | 'guest';

- No, an effect in Angular does not automatically subscribe to all signals within a component. Instead, an effect only
  reacts to signals it accesses directly within its function scope.

- attribute directive
   - host:{
     '(click)': 'onConfirmLeavePage($event)',
     }
      - queryParam = input('myapp', { alias: 'appSafeLink' });
      - private hostElementRef = inject<ElementRef<HTMLAnchorElement>>(ElementRef);

- structural directive always use ng-template, * will use it behind the scenes automatically
-
   * asterisk is just a syntactic sugar for automatically adding ng-template element behind the scenes
- an super important step is : private templateRef = inject(TemplateRef); // give access to the content of the template
- last super important step is : private viewContainerRef = inject(ViewContainerRef); // give access to the place in the
  DOM where this directive is being used. so where this template is being used.
   - this.viewContainerRef.createEmbeddedView(this.templateRef);
   - this.viewContainerRef.clear();
-
   * asterisk is not just syntactic sugar, it also setup property binding, with typescript code. we should use *
     appAuth="'admin'" to put string.

- we can use `hostDirectives` within `@Dicrective` to build some layers

- `if (typeof value === 'string'){}` // js
- `val = parseFloat(value);`// convert from string to number

- `return `${outputTemp} F``

- `tempPipe: 'param1' : 'param2'`

- const sorted = [...value];
- sorted.sort();

- in pipe, transform method only check if there is any change

- in pipe, by setting pure:false within decorator, it will disable caching mechanism of the pipe.
- let pipe execute very time anything changed in the template.

- asc: `sorted.sort((a, b) => a > b ? 1 : -1);`
- desc: `sorted.sort((a, b) => a > b ? -1 : 1);`

- pipe best practice is only transforming what user sees

- services best practice:
   - private tasks = signal<Task[]>([]);
   - allTasks = this.tasks.asReadonly();

- map will produce a new array
- we should always create a new instead of updating in place

```
  updateTaskStatus(taskId: string, newStatus: TaskStatus) {
    this.tasks.update((oldTasks) =>
      oldTasks.map((task) =>
        task.id === taskId ? { ...task, status: newStatus } : task
      )
    );
  }
```

- computed will return a new signal

- effect and computed will do subscription

- component and directive can access element injector
- service cannot access element injector instead it only have access environment injector or module injector

- How to register customized provider for anything

```
export const TASK_STATUS_OPTIONS = new InjectionToken<TaskStatusOptions>(
  'task-status-options'
);
export const taskStatusOptionsProvider: Provider = {
  provide: TASK_STATUS_OPTIONS,
  useValue: TaskStatusOptions
};

// in component
providers: [taskStatusOptionsProvider]

private taskStatusOptinos = inject(TASK_STATUS_OPTIONS);
```

- not put expensive calculations into template. e.g. in get() property
- The expressions that used in template bindings should be simple and straightforward.
   - only use function invocation for singal and event binding
   - for getters, make sure it only has efficient calculations

- pipe transformation values are cached by default.
   - because pipes are just functions that are executed when templates are being evaluated.
   - and therefore, by default, Angular caches the results generated by those pipe transform methods.

- Avoiding Zone Pollution
  // outside of Angular's change detection.
  // outside of the zone.js watch mode.

```
private zone = inject(NgZone);
this.zone.runOutsideAngular(() => {
  // ...
});
```

- OnPush happens when:
   1. some events occurred anywhere inside of sub component tree
   2. an input value changed where we set OnPush.
   3. manually trigger change detection:
  ```
  private cdRef = inject(ChangeDetectorRef);
  
  const subscription = this.messageService.message$.subscribe((messages) => {
    this.messages = messages
    this.cdRef.markForCheck(); // trigger component check change
  });
  ```
   4. signal changes


- to clean up RxJS subscription
   1. ngOnDestroy Hook
   2. DestroyRef
  ```
  private destroyRef = inject(DestroyRef);
  
  // register a function that should be executed if this componnet is about to be destroyed
  this.destroyRef.onDestroy(() => {
    subscription.unsubscribe(); // will clean up subscriptino if the component here should be removed.
  });
  ```

- in template `messages$ | async`
- `imports: [AsyncPipe]`
- automatically setup and clean up that subscription and read those values from the subject, also **trigger change
  detection for this component when new values are received**

- trigger change detection without zone.js for this component
   1. signal, built-in angular
   2. event binding, built-in angular
   3. manually triggering change detection via ChangeDetectorRef

- setTimeout monitored by zone.js

- RxJS:
   - we need to subscribe to kick off the observables.

- signal(values in container) vs observable(values over time)
   - signals are great for managing application state
   - observables are great for managing events & streamed data
      1. signal built-in angular
      2. observable has leaner code for interval
      3. observable only executed when it has at least one subscriber, whereas signal always there

- convert between signal and observable with `toObservalbe` and `toSignal`

- signals always have initial value
- observables can have initial value

- `toSignal` will setup an undefined value for signal by default, but we can setup initial value in configuration object
- `toSignal` has one nice thing that it will automatically cleanup observable subscription

- `catchError((error, obj) => {})` in observable pipe must return a new observable

- Component structure: 12-http-12-interceptors

- Component & Template driven form
   - name="required" ngModel // name is required for angular to manage it

## Template driven approach: we wanna do all the setup and configuration inside of the template.

- Angular managed Form

  ```
  // ngForm change the type into NgForm instead of HTMLFormElement
  <form #form="ngForm" (ngSubmit)="onSubmit(form)">
    <input id type name ngModel/> // no two-way-binding, extract values only form submitted
  </form>
  ```

- validation with attributes or directives
   - `required email`
   - `required minlength="6"`
   - `min`
   - `pattern`

- cons: when using template driven approach, the angular form object isn't available the first time the template is
  being rendered.
- cons: instead, this template defines the form structure, so it's only available thereafter.
- cons: if you try to access control info inside of the template, it won't work.
- solution: use template variable `#email="ngModel"` this syntax is supported by ngModel directive. **To get control
  information**
- Note 1: To get control specific information `#email="ngModel"`
- Note 2: To get form information `form`

- `ng-pristine` tells whether this field has received any input from the user or not. if it is added, it has not
  received any input.
- `ng-invalid` or `ng-valid` tells valid or not

- e.g. `@if (email.touched && email.dirty && email.invalid) {}`

```
constructor() {
  afterNextRender(() => {}); // to register a function that should be executed once. once this component has been rendered for the first time.
  // because it's template-driven approach, **so it's only after the template rendering, that this form is fully initialized.**
}
```

```
  constructor() {
    afterNextRender(() => {
      const savedForm = window.localStorage.getItem('saved-login-form');

      if (savedForm) {
        const loadedFormData = JSON.parse(savedForm);
        const savedEmail = loadedFormData.email;
        // right here: 1. template has been rendered
        // 2. the form object is initialized
        // 3. but the control objects actually aren't fully initialized yet.
        // solution with template driven approach(we would have better solution with reactive driven form):
        setTimeout(() => {
          this.form().controls['email'].setValue(savedEmail); // set value, we can use controls to choose one of those, or all with object
        }, 1);
      }

      const subscription = this.form()
        .valueChanges?.pipe(debounceTime(500)) // user has to stop for at least 500 milliseconds.
        .subscribe({
          next: (value) =>
            window.localStorage.setItem(
              'saved-login-form',
              JSON.stringify({ email: value.email })
            ),
        });

      this.destroyRef.onDestroy(() => subscription?.unsubscribe());
    });
  } 
```

## Reactive driven approach: in template, we just connect elements

- inside FormGroup or nested FormGroup, each key-value pair represents one control. e.g. email control for email input.

### first step: setup the form

```ts
form = new FormGroup({
  // email and password can be any name
  email: new FormControl(''),
  password: new FormControl('')
});
```

### second step: connect this form to template

```ts
imports: [ReactiveFormsModule]

```

## approach 1
```
<input id="email" type="email" [formControl]="form.controls.email" />
```
## approach 2
```
<form [formGroup]="form">
  <input id="email" type="email" [formControlName]="password" />
</form>
```

### pros

- pros: Submitting: in reactive approach, we don't have to pass any argument to onSubmit, because we already have access
  to the form in class
- pros: get access and have type safe when using .value `this.form.controls.email` and `this.form.value.email`

### validators

```ts
form = new FormGroup({
  // can be [], or {validators:[], }
  // asyncValidators?
  // nonNullable?, it can make sure this input cannot be set to null again if it were reset.
  // updateOn?, it can control if the value managed by Angular should update on every keystroke or only if the input loses focus with updateOn.
  email: new FormControl('', {
    validators: [Validators.email, Validators.required, (control) => {return null or nothing for valid, or {} for invalid}]
  }), 
  password: new FormControl('')
});
```

```TS
// custom validators
function customValidator(control: AbstractControl) {
  if (control.value.includes('?')) {
    return null;
  }
  
  return { doesNotContainQuestionMark: true };
}

// custom async validators
function emailIsUnique(control: AbstractControl) {
  if (control.value !== 'test@example.com') {
    return of(null); // `of` produces an observable that instantly emits a value
  }
  
  return of({ notUnique: true });
}
```

### prepopulate data

- we don't need afterNextRender within constructor, because we created form inside class, we don't have to wait for the
  template to render for it to be initialized. we already initialized form in the code.
- so we can use `ngOnInit() {}`

```TS
// save value into localStorage
private destroyRef = inject(DestroyRef);
const subscription = this.form.valueChanges.pipe(debounceTime(500)) // we don't need ? after valueChanges.
        .subscribe({
          next: (value) =>
            window.localStorage.setItem(
              'saved-login-form',
              JSON.stringify({ email: value.email })
            ),
        });
this.destroyRef.onDestroy(() => subscription.unsubscribe());

// update form value with localStorage
1. outside component, doesn't work for ssr
2. inside ngOnInit before `subsription` as usual
```

### nested FormGroup validator

```ts
// access controls within nested formgroup
function equalValues(control: AbstractControl) {
  const password = control.get('password')?.value;
  const confirmPassword = control.get('confirmPassword')?.value;
  if (password === confirmPassword) return null;
  
  return { passwordNotEuqal: true };
}
```

## Routing

### setting up

```ts {filename="main.ts"}
//...
import { provideRouter } from '@angular/router';

bootstrapApplication(AppComponent, {
  providers: [
    provideRouter([
      {
        path: 'tasks', // <domain>/tasks
        component: TasksComponent,
      },
    ]),
  ],
}).catch((err) => console.error(err));
```

#### outsource routes

```ts {filename="app.routes.ts"}
import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: 'tasks', // <domain>/tasks
    component: TasksComponent,
  },
];
```

#### outsource app config

```ts {filename="app.config.ts"}
import { ApplicationConfig } from '@angular/core';

export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes),
  ],
};
```

#### final setup

1. use `<router-outlet />` inside app.component.html
2. import `RouterOutlet` to app.component.ts

### routerLink && routerLinkActive

- use `routerLink` directive instead of href within anchor tag

### retrieve route parameters

#### via input

```ts {filename="app.config.ts"}
export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes, withComponentInputBinding()), // any argument except first
  ],
};
```

```ts {filename="Component"}
  userId = input.required<string>(); // angular will set this userId
```

- cons: doesn't work for child routes
   - solution: add `withrouterConfig({paramsInheritanceStrategy: 'always'})` in privodeRouter of providers

#### via observables

- pros: works for child routes

```ts
private activatedRoute = inject(ActivatedRoute);

ngOnInit(): void {
  this.activatedRoute.paramMap... // to extract paramMap
  this.activatedRoute.queryParams... // to extract queryParams
}
```

### programmatically routing

```ts
private router = inject(Router);

// disable back navigation by setup replaceUrl
this.router.navigate([['/users', this.userId()]], {replaceUrl: true, });
```

### fallback route

- with `**` path

### queryParams

- `[queryParams]="{order: order() === 'asc' ? 'desc' : 'asc'}"` // set to asc when undefined or desc
- by setting up with `withComponentInputBinding()` inside `app.config.ts`, we can extract queryParams by simply use
  `order = input<'asc' | 'desc'>();`
- or by observables

### data property inside route

- for static data

```ts {filename="app.routes.ts"}
  data: { message: 'Hello'}
```

- by setting up with `withComponentInputBinding()` inside `app.config.ts`, we can extract with input

### resolve property inside route

- for dynamic data

#### resolver function

```ts {filename="user-tasks.component.ts"}
export const resolveUserName: ResolveFn<string> = (
  activatedRoute: ActivatedRouteSnapshot,
  routerState: RouterStateSnapshot
) => {
  const usersService = inject(UsersService);
  const userName =
    usersService.users.find(
      (u) => u.id === activatedRoute.paramMap.get('userId')
    )?.name || '';
  return userName;
};
```

- we can extract data from resolver by input or @Input

### Important

> Resolver functions will be re-executed if a route parameter changes, but not if a query parameter changes.

- by solving that, we can add `runGuardsAndResolvers: 'paramsOrQueryParamsChange'`

### Route Guards

- `can**` property. To control access to a route. All of them take arrays of guard functions or classes.
- `canMatch` -> `canActivate`(before the component has been loaded)

```ts
const dummyCanMatch: CanMatchFn = (route, segments) => {
  const router = inject(Router);
  const shouldGetAccess = Math.random();
  if (shouldGetAccess < 0.5) {
    return true;
  }
  return new RedirectCommand(router.parseUrl('/unauthorized'));
};
```

- `canDeactivate`, the idea is that we can control whether a user is allowed to leave a page or not.

```ts {filename="new-task.component.ts"}
export const canLeaveEditPage: CanDeactivateFn<NewTaskComponent> = (component) => {
  if (component.enteredTitle() || component.enteredDate() || component.enteredSummary()) {
    return window.confirm('Do you really want to leave? You will lose the entered data.')
  }
  return true;
}
```

### fix redirect to same url within component

1. update component.
2. change `runGuardsAndResolvers:'always'` to always inside parent route.

```ts
// 1. update component
this.router.navigate(['./'], {
   relativeTo: this.activatedRoute,
   onSameUrlNavigation: 'reload',
   queryParamsHandling: 'preserve',
});
```

## Performance - Lazy Loading

### Route-based lazy loading

```ts {filename="users.routes.ts"}
    loadComponent: () =>
      import('../tasks/tasks.component').then((mod) => mod.TasksComponent),
```

### Deferrable Views(>= 17)

- enhancement for route base lazy loading

## Building - SPA(Single Page Application)

- Build a **client-side only** web app: all the UI rendering happens on the client side by JS code that is being served
  by the web host to the website visitors.
- All compiled and optimized application code executes in the browsers.
- Therefore, we don't need any dynamic web server. A **static host** suffices.
- Potential Cons: initially missing content, bad SEO(search engine crawlers will likely see an empty site, because they
  are not waiting for the client-side Javascript code to render all the content. At least they are not guaranteed to
  wait.)
- Use case: internal app, app that requires authentication, etc.

## Building - SSR

- Angular app routes are **rendered on-demand** on a dynamic web server
- Browser receives finished, rendered page. This page still includes lots of Angular Javascript code, which then takes
  over and **hydrated("activated")** the page once it has been received.
- Web app is **hydrated** and becomes a SPA after initial rendering. Subsequent actions will be handled by client-side
  JS code.
- Pros: instant responses due to client-side JS doing the heavy work. + Finished pages without missing content for the
  initial request.
- **Dynamic web server** is required.
- Advantage: users no longer receive an empty HTML file or an almost empty HTML file, but instead, a file that contains
  all the content. It's also great for search engine crawlers.
- Potential disadvantages: Long-taking tasks may cause empty pages, complexity but this approach also has some potential
  disadvantages.

>
`, right after the next overall Component render cycle., right after the next overall Component render cycle.afterNextRender(() => {})`
only runs in browser, right after the next overall Component render cycle.

## Refs

- ElementRef: for directives, get access to the host element.
   - `private hostElementRef = inject<ElementRef<HTMLAnchorElement>>(ElementRef);`
   - with `this.elementRef.nativeElement`
- TemplateRef: within Directive, to hold content within `ng-template`
- ViewContainerRef: is a reference to the place in the DOM where above template is being used.
   - `this.viewContainerRef.createEmbeddedView(this.templateRef);`
   - `this.viewContainerRef.clear();`: will remove rendered content.

## ng-content vs ng-container vs ng-template

| **Feature**                        | **ng-content**                           | **ng-container**                           | **ng-template**                        |
|------------------------------------|------------------------------------------|--------------------------------------------|----------------------------------------|
| **Purpose**                        | Content projection from parent to child. | Logical grouping without extra DOM nodes.  | Defines reusable or dynamic templates. |
| **DOM Rendering**                  | Yes, renders content in DOM.             | No, doesn't create a DOM element.          | No, not directly rendered unless used. |
| **Use with Structural Directives** | No                                       | Yes                                        | Yes                                    |
| **Reusability**                    | No                                       | No                                         | Yes                                    |
| **Use Case**                       | Pass content into child components.      | Apply directives without adding DOM nodes. | Dynamically render or reuse templates. |

| **Scenario**                                                          | **Directive to Use** |
|-----------------------------------------------------------------------|----------------------|
| Passing dynamic content to child components                           | ng-content           |
| Grouping elements with structural directives without adding DOM nodes | ng-container         |
| Defining templates for dynamic or delayed rendering                   | ng-template          |

| **Feature**  | **ContentChildren**                          | **ViewChildren**                                           |
|--------------|----------------------------------------------|------------------------------------------------------------|
| **Scope**    | Queries elements projected via <ng-content>. | Queries elements declared in the component's own template. |
| **Timing**   | Available in ngAfterContentInit.             | Available in ngAfterViewInit.                              |
| **Use Case** | For working with external content.           | For working with internal content.                         |

## tapResponse ---> rxjs
```TS
tapResponse(
  (data) => mySuccessAction({data}),
  (error) => myFailureAction({error}),
)

map(
  (data) => mySuccessAction({data}),
),
catchError(
  (error) => of(myFailureAcction({error})
)
```

## ComponentStore
```TS
import { HttpClient, HttpErrorResponse, HttpHeaders, } from '@angular/common/http';
import { ComponentStore } from '@ngrx/component-store';
import { Injectable, inject } from '@angular/core';
import { ApiService } from '@mgm/shared-frontend';
import { Router } from '@angular/router';
import { catchError, concatMap, EMPTY, Observable, switchMap, tap } from 'rxjs';
import { MY_URL } from '../utils/url.const';
import { APP_CONST } from '../utils/app.const';
import { ToastService } from '@mgm/ux-frontend';

export interface IPoolNumber {
  poolNumber: string;
}

export interface IAddNewPoolState {
  addNewPoolData: IPoolNumber[];
  xmlData: string[];
  tableChangeEvent: any;
  loading: boolean;
  loaded: boolean;
  error: string | null;
}

export const initialState: IAddNewPoolState = {
  addNewPoolData: [],
  xmlData: [],
  loaded: false,
  loading: false,
  error: null,
  tableChangeEvent: {
    sortField: 'poolNumber',
    sortOrder: 'asc',
  },
};

@Injectable()
export class AddNewPoolStore extends ComponentStore<IAddNewPoolState> {
  constructor() {
    super(initialState);
  }
  private apiService = inject(ApiService);
  private router = inject(Router);
  private http = inject(HttpClient);
  private messageService = inject(ToastService);

  // selectors
  readonly sortOrder$ = this.select(
    (state) => state.tableChangeEvent.sortOrder,
  );
  readonly sortField$ = this.select(
    (state) => state.tableChangeEvent.sortField,
  );
  readonly tableData$: Observable<IPoolNumber[]> = this.select((state) => {
    return state.addNewPoolData;
  });

  // updaters
  readonly addToTableData = this.updater((state, poolNumber: IPoolNumber) => ({
    ...state,
    addNewPoolData: [...state.addNewPoolData, poolNumber],
  }));
  readonly setTableData = this.updater(
    (state, addNewPoolData: IPoolNumber[]) => ({
      ...state,
      addNewPoolData,
    }),
  );
  readonly setLoading = this.updater((state, loading: boolean) => ({
    ...state,
    loading,
  }));
  readonly setLoaded = this.updater((state, loaded: boolean) => ({
    ...state,
    loaded,
  }));
  readonly setXmlData = this.updater((state, xmlData: string[]) => ({
    ...state,
    xmlData,
    error: null,
  }));
  readonly setError = this.updater((state, error: string | null) => ({
    ...state,
    error,
    loading: false,
  }));

  // effects
  readonly downloadTemplate = this.effect((trigger$: Observable<void>) =>
    trigger$.pipe(
      tap(() => this.patchState({ loading: true })),
      concatMap(() =>
        this.apiService
          .sendDownloadRequest(MY_URL.NEW_POOL.GET_POOL_TEMPLATE())
          .pipe(
            tap((response) => {
              this.patchState({ loading: false });
              if (response) {
                const blob = new Blob([<Blob>response], {
                  type: APP_CONST.FILE_TYPE.SPEEDSHEET.RESPONSE,
                });
                const fileURL = URL.createObjectURL(blob);
                const link = document.createElement('a');
                const fname = `PoolTemplate`;
                link.href = fileURL;
                link.download = `${fname}.${APP_CONST.FILE_TYPE.SPEEDSHEET.TYPE}`;
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);

                this.messageService.add({
                  summary: 'Action Success',
                  severity: 'success',
                  detail: 'Request summary is downloaded.',
                });
              }
            }),
            catchError((error: HttpErrorResponse) => {
              this.patchState({ loading: false });
              this.messageService.add({
                summary: 'Action Failure',
                detail: error?.message ? error?.message : 'unknown error',
                severity: 'error',
              });
              return EMPTY; // Prevent the stream from terminating
            }),
          ),
      ),
    ),
  );

  readonly removePool = this.effect<{
    ptsTransferRqstID: number;
    vrsnId: number;
    pools: number[];
  }>((request$) =>
    request$.pipe(
      tap(() => this.setLoading(true)),
      switchMap((requestBody) =>
        this.http
          .post<string>(MY_URL.NEW_POOL.REMOVE_POOL(), requestBody, {
            headers: new HttpHeaders({
              'Content-Type': 'application/json',
            }),
          })
          .pipe(
            tap(() => this.setLoading(false)), // Example: Process success response here
            catchError((error: HttpErrorResponse) => {
              this.setLoading(false);
              this.setError(error.message || 'An error occurred');
              return EMPTY;
            }),
          ),
      ),
    ),
  );
}
```

```TS
@Component({
  providers: [AddNewPoolStore],
})
export class ConsumerComponent {
  private addNewPoolStore = inject(AddNewPoolStore);
  // select
  tableData$: Observable<IPoolNumber[]> = this.addNewPoolStore.tableData$;
  // update
  this.addNewPoolStore.addToTableData( { poolNumber: "1234" } );
  // effect
  this.addNewPoolStore.downloadTemplate();
}
```

## DI (dependency injection)
- Standard Use Cases: Constructor injection or `inject`.
- Dynamic Logic: Factory providers or `InjectionToken`.
- Custom Configurations: `@Inject`, `@Optional`, `@Host`, `@Self`, or `@SkipSelf`.
- Standalone Components: Use `inject` for cleaner code.

## Handle Unit Testing Mistakes
- [Angular Unit Testing Mistakes](https://www.youtube.com/watch?v=BTEx2X_8b-U&ab_channel=DecodedFrontend)

1. we should initiate variables in `beforeEach`
2. we should use `fixture.componentRef.setInput('data', widgetTestingData)` to set input value
3. we should use `<p data-testId="no-location"`, and 
    ```html
    const noLocation = fixture.debugElement.query(By.css('[data-testId="no-location"]'));
    // noLocation.nativeElement.value = 'tomorrow';
    // noLocation.nativeElement.dispatchEvent(new Event('change')); // to fire the change event
    expect(noLocation).toBeTruthy();
    ```

## Flatten Nested Observables
- [Flatten Nested Observables](https://www.youtube.com/watch?v=OhuRvfcw3Tw&ab_channel=DecodedFrontend)

1. we should use flatten operators like `switchMap` to flatten nested observables
2. we should use `takeUntilDestroyed` at then end of pipe chain. we can have a eslint rule to enforce this.
    ```ts
    this.searchConfig$.pipe(
      switchMap((config) => this.http.get(config.url))
      takeUntilDestroyed(this.destroyRef),
    ).subscribe((data) => {
      this.data = data;
    });
    ```
3. we should add subscription right after component property. Either use signal or async pipe(). With async pipe we can remove `takeUntilDestroyed`.
    ```ts
    // this is a property in component
    users$ = toSignal(this.searchConfig$).pipe(
      switchMap((config) => this.http.get(config.url)),
      takeUntilDestroyed(this.destroyRef),
    );
    ```
4. avoid **cold observables**, which is executing observable logic multiple times.
   -  approach 1: reduce subscription in template
   -  approach 2: use **hot observables**
    ```ts
    users$ = toSignal(this.searchConfig$).pipe(
      switchMap((config) => this.http.get(config.url)),
      // when a new subscriber arrives, the logic before shareReplay will not be executed
      // the switchMap will executed only when a new config is emitted
      shareReplay(1),
    );
    ```
5. avoid improper usage of `distinctUntilChanged()` in pipe chain.
    - `distinctUntilChanged()` only works for primitive values, not for objects. `// {} === {}` is false.
    - to resolve this by using `distinctUntilChanged((prev, curr) => prev.id === curr.id)` or `distinctUntilKeyChanged('id')`, or deep comparison.
6. avoid using side effects in the wrong places.
    - `tap` is for side effects, not for changing the observable stream.
    - `tap` is for logging, debugging, or triggering side effects.


