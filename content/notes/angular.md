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
- After upgrading or downgrading Angular, it’s a good practice to remove the node_modules folder and reinstall dependencies to ensure everything works with the new version:
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">
<app-root></app-root>
<!-- Bootstrap setup -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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