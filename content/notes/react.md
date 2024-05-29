+++
title = 'React'
date = 2024-01-25T22:33:37-04:00
+++

## Create a project
```
npm create vite@latest project-folder-name
```

### Shortcuts
```
// rafce
// rafc
// rfc
```

## React Tutorials 1
- [My React Notes with commit](https://github.com/yixianwang/my-react-app/commits/main/)
- [Youtube](https://www.youtube.com/watch?v=CgkZ7MvWUAA)


## React Tutorials 2
- [Youtube](https://www.youtube.com/watch?v=LDB4uaJ87e0)
- [Youtube Github](https://github.com/bradtraversy/react-crash-2024)

## Project: React Jobs
1. create a project, update vite.config.ts
1. empty app.tsx, delete app.css, and empty index.css
1. setup tailwind, `vite react tailwind` 

1. reformat the code copied from the index.html into App.tsx
1. reformat with component Navbar.tsx
1. assets/images/logo.png

### single page development
1. props, default values and constraint types `(props) => {...}` or `({ isHome = false}) => { ... }`
1. useState, `onClick={() => setSome((prevState) => !prevState)}`

### additional package
1. react-icon, install additional package `npm i react-icons`
    - remove <i></i>
    - `import { FaArrowLeft } from 'react-icons/fa'`
    - `<FaArrowLeft className='mr-2' /> Some Texts`
1. react-router-dom, `npm i react-router-dom`

### routing
- within `App.tsx`
```tsx
import {
  Route,
  createBrowserRouter,
  createRoutesFromElements,
  RouterProvider,
} from `react-router-dom`;
import HomePage from './pages/HomePage';

const router = createBrowserRouter(
  // createRoutesFromElements(<Route index element={<HomePage />} />)
  createRoutesFromElements(<Route path='/about' element={<HomePage />} />)
);

const App = () => {
  return <RouterProvider router={router} />;
}
export default App;
```

### layout
1. create folder `pages`, including HomePage, ...
1. within `App.tsx`, wrap other route with layout route
1. use `Outlet` in layout component

- we prefer `link tag`, not `a tag`, because `a tag` does a complete page refresh
- How to change a tag to link tag:
  ```
  import {Link} from 'react-router-dom'

  // 1. change all `a` to `Link`
  // 2. change `href` to `to`
  ```

### 404 page
- create 404 page
- add route with *

### active link on NavBar
- use `NavLink` instead of `Link`
- className attached with a function

### Conditional rendering
- use props and `? :`

### Mock API
1. use json server with our json file
    - [Json Server](https://www.npmjs.com/package/json-server)
2. install: -D means dev dependency `npm i -D json-server`
3. update `package.json`
    - within `scripts` add `"server": "json-server --watch src/jobs.json --port 8888"`
4. run `npm run server`
5. use `useEffect` hook to make a request, we also use `useState`
    - `const [jobs, setJobs] = useState([]);`
    - `const [loading, setLoading] = useState(true);`
    ```ts
    useEffect( () => {
      const fetchJobs = async () => {
        try {
          const res = await fetch('http://localhost:8000/jobs'); // without proxy
          const data = await res.json();
          setJobs(data);
        } catch (error) {
          console.log('Error fetching', error);
        } finally {
          setLoading(false);
        }
      }

      fetchJobs();
    }, []);


    {
      loading ? (
        <Spinner loading={loading} />
      ) : (
        <>
          {jobs.map((job) => (
            <JobListing key={job.id} job={job} />
          ))}
        </JobListing>
      )
    }
    ```
6. use `React Spinners`, install: `npm i react-spinners`
    - [Ref](https://www.npmjs.com/package/react-spinners)
    - create a spinner ui component

#### Different approach to fetch data
- `react suspense`, it allows us to do a render while fetching, so we basically provide a fallback UI such as a spinner. (what we are doing here we fetch on render, because when it renders it has a side effect of fetching the data)
- `react query` and `SWR` are third-party libraries. They make data fetching a little easier.
- react 19 has new use hook

### Proxying
- with create react app use `package.json`
- with vite we use `vite.config.ts`, and add following in `server`
```ts
proxy: {
  '/api': {
    target: 'http://localhost:8000',
    changeOrigin: true,
    rewrite: (path) => path.replace(/^\/api/, ''),
  },
},

// every time we send a request we use /api, i.e. /api/jobs (instead of localhost:00/jobs)
```

### data loader from react router for single page
- another way to fetch data
#### useEffet way: traditional way
```ts
import {useState, useEffect} from 'react'; 
import {useParams} from 'react-router-dom';
import Spinner from '../component/Spinner';

const JobPage = () => {
  const { id } = useParams();
  const [job, setJob] = useState(null);
  cont [loading, setLoading] = useState(true);

  useEffect( () => {
    const fetchJob = async () => {
      try {
        const res = await fetch(`/api/jobs/${id}`) // use ` here not '
        const data = await res.json();
        console.log(data);
        setJob(data);
      } catch (error) {
        console.log('Error fetching data', error);
      } finally {
        setLoading(false);
      }
    };

    fetchJob();
  }, []);

  return loading ? <Spinner /> : <h1>{job.title}<h1/>
}

export default JobPage;
```

#### new way: data loader way(a new feature with react router not react itself)
```ts
// 5.
import {useParams, useLoaderDAta} from 'react-router-dom'; 

const JobPage = () => {
  const { id } = useParams();

  // 6.
  const job = useLoaderData();
  
  // 7.
  return <h1>{job.title}<h1/>
}

// 1. 
const jobLoader = async ({params}) => {
  const res = await fetch(`/api/jobs/${params.id}`) // use ` here not '
  const data = await res.json();
  return data;
};

// 2. 
export { JobPage as default, jobLoader };
```

```ts
// within App.tsx
// 3. 
import JobPage, {jobLoader} from './pages/JobPage';

// 4. we can pass this jobLoader into other components as well and use that to get a job by its id
...
<Route path='/jobs/:id' element={<JobPage />} loader={jobLoader} />
...
```

### Forms
- change `class` to `className`
- change `for=` to `htmlFor=`
> Other ways to work with forms, including `foric`
- the most common basic way to work with form:
  - adding a piece of `useState` for every field in our form.

- 2:25:26