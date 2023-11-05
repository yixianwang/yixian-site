+++
title = 'Notebook'
date = 2023-10-24T03:10:46-04:00
+++


<!-- vim-markdown-toc GFM -->

* [To MP3 Converter Free](#to-mp3-converter-free)
* [pandoc convert markdown to org](#pandoc-convert-markdown-to-org)
* [set in c++](#set-in-c)
* [Enable/Disable Monitor](#enabledisable-monitor)
* [0x3f3f3f3f && 0xcfcfcfcf](#0x3f3f3f3f--0xcfcfcfcf)
* [vim Table Mode](#vim-table-mode)
* [vim generate contents](#vim-generate-contents)
* [scp](#scp)
* [zip](#zip)
* [patch](#patch)
* [conda](#conda)
* [export dependencies from poetry to requirements.txt](#export-dependencies-from-poetry-to-requirementstxt)
* [change poetry python version](#change-poetry-python-version)
* [python](#python)
* [special characters for ps1 in bashshell](#special-characters-for-ps1-in-bashshell)
* [rsync](#rsync)
* [crontab.guru](#crontabguru)
* [pytest](#pytest)
* [github](#github)
  * [remove file from staging area](#remove-file-from-staging-area)
  * [viewing info about the remote repository](#viewing-info-about-the-remote-repository)
  * [pushing changes](#pushing-changes)
  * [merge a branch](#merge-a-branch)
  * [deleting a branch](#deleting-a-branch)
  * [stash](#stash)
  * [diffmerge](#diffmerge)
  * [add](#add)
  * [remove changes](#remove-changes)
  * [change commit message(changed commit history)](#change-commit-messagechanged-commit-history)
  * [add a file to the last commit(changed commit history)](#add-a-file-to-the-last-commitchanged-commit-history)
  * [commited to the wrong branch](#commited-to-the-wrong-branch)
    * [undo some commit but other people have already pulled those changes](#undo-some-commit-but-other-people-have-already-pulled-those-changes)
* [itertools](#itertools)
* [Sorting Lists, Tuples, and Objects](#sorting-lists-tuples-and-objects)
  * [Lists](#lists)
* [Objects](#objects)
* [global vs nonlocal](#global-vs-nonlocal)
* [Context Manager](#context-manager)
* [grep](#grep)
* [emacs vc](#emacs-vc)
* [emacs magit](#emacs-magit)
* [c++ STL](#c-stl)
* [c++ concept && requires](#c-concept--requires)

<!-- vim-markdown-toc -->

## To MP3 Converter Free
```
cat *.mp3 > final.mp3

# best
brew install mp3wrap
mp3wrap output.mp3 *.mp3
```

## pandoc convert markdown to org
```
pandoc -f markdown -t org -o note_dynamic_programming.org note_dynamic_programming.md
```

## set in c++
```c++
#include <vector>
#include <numeric>
#include <iostream>
#include <cassert>
#include <unordered_map>
#include <unordered_set>
#include <set>

#include <iostream>
#include <queue>
#include <vector>
#include <set>
#include <map>


#define assertm(exp, msg) assert(((void)msg, exp))
#define print(input) for (auto& elem : input) std::cout << elem << std::endl

int main() {

  auto cmp = [](const std::pair<int, int>& a, const std::pair<int, int>& b) {return a.second < b.second;};

  std::set<std::pair<int, int>, decltype(cmp)> heap;

  heap.insert(std::make_pair(1, 3));
  heap.insert(std::make_pair(31, 1));
  heap.insert(std::make_pair(4, 4));
  heap.insert(std::make_pair(2, 2));
  heap.insert(std::make_pair(5, 5));


  auto it = heap.begin();
  it = std::next(it, 2);
  it = std::prev(it, 1);
  std::cout << it->first << " " << it->second << std::endl;

  int index = 31;
  auto it2 = std::find_if(heap.begin(), heap.end(), [index](const std::pair<int, int>& a) {return a.first == index;});
  heap.erase(it2);

  it = heap.begin();
  std::cout << it->first << " " << it->second << std::endl;

  return 0;
}

```

## Enable/Disable Monitor
```
SwitchResX
```

## 0x3f3f3f3f && 0xcfcfcfcf
If you are using C++ to write program, sometimes you need to set an large number. We can use INT_MAX of course, however, sometimes we may get overflow if we add the large number by 1.

Some people they like use this number as INF which is 0x3f3f3f3f.
For -INF, we can use 0xcfcfcfcf


## vim Table Mode
```markdown
\tm
|
||
[|, ]|, {| & }| to move left | right | up | down cells
i| or a| # insert a cell
\tdd # delete a row
\tdc # delete a coloumn
\tic # insert column
```

## vim generate contents
```bash
:GenTocGFM
  Generate table of contents in GFM link style.
  This command is suitable for Markdown files in GitHub repositories, like README.md, and Markdown files for GitBook.
:GenTocRedcarpet
  Generate table of contents in Redcarpet link style.
  This command is suitable for Jekyll or anywhere else use Redcarpet as its Markdown parser.
:GenTocGitLab
  Generate table of contents in GitLab link style.
  This command is suitable for GitLab repository and wiki.
:GenTocMarked
  Generate table of contents for iamcco/markdown-preview.vim which use Marked markdown parser.
```

## scp
```bash
scp -ri /Users/yixianwang/.ssh/aws_ps.pem destination ec2-user@ec2-18-217-15-234.us-east-2.compute.amazonaws.com:~/
scp -ri /Users/yixianwang/.ssh/aws_ps.pem ec2-user@ec2-18-217-15-234.us-east-2.compute.amazonaws.com:~/ destination

scp -ri /Users/yixianwang/.ssh/aws_skater.pem ubuntu@ec2-3-142-96-155.us-east-2.compute.amazonaws.com:~/project4 ~/Downloads/
```

## zip
```bash
zip -r py_image_manipulation.zip py_image_manipulation
```

## patch
```
make clean
make -f Makefile.test clean
```

```bash
diff -ruN src src-finished > xv6.patch
```

```bash
1. Insert "xv6.patch" file in "src" folder
2. Under "src" folder, command "patch -i xv6.patch"
3. Make xv6 and run the tests
```

## conda
```bash
conda create --name myenv Python=3.8 --no-default-packages

conda env list
conda env remove -n myenv

conda install numpy [matplotlib seaborn pandas]
conda list

# search all versions of pandas that available to install
conda search pandas
conda install pandas=0.25.2
conda update pandas

# remove package
conda remove numpy

# install pip locally with conda, inside the virtual env
conda install pip
```


## export dependencies from poetry to requirements.txt
```bash
python3 -m venv .venv
source .venv/bin/activate

poetry export --without-hashes > requirements.txt

pip install -r requirements.txt
```

## change poetry python version
```bash
poetry env use /usr/local/bin/python3.9
```


## python
```bash
python -m SimpleHTTPServer 8000
```

## special characters for ps1 in bashshell
```bash
\h the hostname up to the first .
\n newline
\s the name of the shell
\t the current time in 24-hour format
\u the username of the current user
\w the current working direcotry
\W the basename of the current working directory
```

## rsync
```bash
rsync -zaP --dry-run dir dir/
```

## crontab.guru
```bash
crontab -l
crontab -e
crontab -r
```

## pytest
```bash
pytest --junitxml=result.xml

poetry run pytest test_py_image_manipulation.py
```


## github
```bash
git config --global user.name "firstname lastname"
git config --global user.email "email@email.com"

git config --list
```

```bash
git help <verb>
git <verb> --help
```

```bash
git diff
```

### remove file from staging area
```bash
git reset filename # remove one file
git reset # remove everythin
```

### viewing info about the remote repository
```bash
git remote -v
git branch -a
```

### pushing changes
```bash
git pull origin master
git push origin master # origin: the name of remote repository. master: the branch we want to push to
```

```bash
git branch branchname
git checkout branchname
git push -u origin branchname
git branch -a
```

### merge a branch
```bash
git checkout master
git pull origin master
git branch --merged
git merge branchname
git push origin master
```

### deleting a branch
```bash
git branch --merged
git branch -d branchname
git branch -a
git push origin --delete branchname
```

### stash
```bash
git stash save "Worked on some function"
git stash list
git stash apply/drop stash@{0}
git stash pop

git stash clear # be careful here

git checkout -- .
```

### diffmerge
```bash
git config --global diff.tool diffmerge
git config --global difftool.diffmerge.cmd 'diffmerge "$LOCAL" "$REMOTE"'
git config --global merge.tool diffmerge
git config --global mergetool.diffmerge.cmd 'diffmerge --merge --result="$MERGED" "$LOCAL" "$(if test -f "$BASE"; then echo "$BASE"; else echo "$LOCAL"; fi)" "$REMOTE"'
git config --global mergetool.diffmerge.trustExitCode true
# git config --global mergetool.keepBackup false
```

```bash
git diff # old
git difftool
```

```bash
git merge branchname
git mergetool
git commit
```

### add
Ignore the deleted files in git version 2
```bash
git add --no-all sub_dir/
```
Ignore the untracked files
```bash
git add -u/--update
```

### remove changes
Remove changes of a file
```bash
git checkout filename
```

### change commit message(changed commit history)
```bash
git commit --amend -m "new message here"
```

### add a file to the last commit(changed commit history)
```bash
git commit --amend 
:wq
git log --stat
```

### commited to the wrong branch
move commit between branch
cherry-pick creates a new commit based off our original(doesn't delete)
```bash
git log # copy the hash
git checkout branchname
git cherry-pick #hash
git checkout master
```
remove the master commit
- git reset soft: set back to the commit that we specified but it will keep our changes that we've made in the staging directory
```bash
git reset --soft #the initial commit hash
```
- git reset mixed(default): keep the changes in the working directory instead of staging area
```bash
git reset #the hash
```
- git reset hard: make all of our tracked files match the state that they were in at the hash we specified(leave the untracked file alone)
```bash
git reset --hard #the initial commit hash
```

remove the untracked directories and files
```bash
git clean -df
```

recover from the hard reset
```bash
git reflog

git checkout #hash before the reset
git log # to check whether the commit exists

git branch backup
git branch # to see all branches
```

#### undo some commit but other people have already pulled those changes
revert: creates a new commit to reverse the effect of some ealier commits(won't rewrite history)
it's not going to modify or delete our existing commits
```bash
git log
git revert #hash of the commit need to be covered
```

`git diff #src #desc`

## itertools
```python
# count
list(zip(itertools.count(), data))
counter = itertools.count()
counter = itertools.count(start=5, step=-2.5)
print(next(counter))

# zip_longest vs zip
data = [1, 2, 3, 4]
result = list(zip(range(10), data))
result = list(itertools.zip_longest(range(10), data))

# cycle
counter = itertools.cycle([1,2,3])
counter = itertools.cycle(("On", "Off"))
print(next(counter))

# repeat
counter = itertools.repeat(2)
counter = itertools.repeat(2, times=3)
print(next(counter))

# startmap vs map
squares = map(pow, range(10), itertools.repeat(2)) # take iterables
print(list(squares))

squares = map(pow, [(0, 2), (1, 2), (2, 2)]) # take paired tuples
print(list(squares))

# combinations vs permutations
itertools.combinations_with_replacement(list1, 2)
itertools.combinations(list1, 2)

itertools.permuations(list1, 2)
itertools.product(list1, repeat=4)

# chain
itertools.chain(list1, list2, list3, ...)

# isclice
itertools.islice(range(10), 5) # return the first 5 elements of the iterable
itertools.islice(range(10), 1, 5) # return the [1, 5) elements of the iterable
itertools.islice(range(10), 1, 5, 2) # step 2

with open("test.log", 'r') as file:
  header = itertools.islice(file, 3)
  for line in header:
    print(line, end='')

# compress vs filter
itertools.compress(letters, selectors)

filter(lt_2, numbers) 
itertools.filterfalse(lt_2, numbers) 
itertools.dropwhile(lt_2, numbers) 
itertools.takewhile(lt_2, numbers) 


# accumulate
itertools.accumulate(numbers) # default is add operation
import operator
itertools.accumulate(numbers, operator.mul) 

# group by
# note: people needs to be sorted beforehand
people = [
    {
        'name': 'John Doe',
        'city': 'Gotham',
        'state': 'NY'
    },
    {
        'name': 'Jane Doe',
        'city': 'Kings Landing',
        'state': 'NY'
    },
]

def get_state(people):
    return people['state']

people_group = itertools.groupby(people, get_state)

for key, group in people_group:
    print(key)
    for person in group:
      print(person)
    print()

# ?
copy1, copy2 = itertools.tee(person_group)
```

## Sorting Lists, Tuples, and Objects
### Lists
sort function is more flexible
```python
li = [9, 1, 8, 2, 7]
s_li = sorted(li)
s_tu = sorted(tu)
s_di = sorted(di)
s_li = sorted(li, reverse=True)
print("sorted function", s_li)

li.sort()
li.sort(reverse=True)
print("sorted method", li)
```

sort on abs value
```python
li = [-6, -5, -4, 1, 2, 3]
s_li = sorted(li, key=abs)
print(s_li)
```

## Objects
```python
class Employee():
    def __init__(self, name, age, salary):
        self.name = name
        self.age = age
        self.salary = salary
    def __repr__(self):
        return f"({self.name}, {self.age}, {self.salary})"

e1 = Employee("Carl", 37, 2000)
e2 = Employee("Sarah", 23, 10000)
e3 = Employee("John", 77, 300)

employees = [e1, e2, e3]

# customize key function
def e_sort(emp):
    return emp.name

s_employees = sorted(employees, key=e_sort, reverse=True)

# lambda function
s_employees = sorted(employees, key=lambda e: e.name)

# attrgetter
from operator import attrgetter
s_employees = sorted(employees, key=attrgetter('age'))
```

## global vs nonlocal
LEGB
> Local, Enclosing, Glboal, Built-in

## Context Manager
```python
import os
from contxtlib import contextmanager

cwd = os.getcwd()
os.chdir("Sample-dir-one")
print(os.listdir())
os.chdir(cwd)


cwd = os.getcwd()
os.chdir("Sample-dir-two")
print(os.listdir())
os.chdir(cwd)

@contextmanager
def change_dir(destination):
    try:
        cwd = os.getcwd()
        os.chdir(destination)
        yield
    finally:
        os.chdir(cwd)

with change_dir("Sample-dir-one"):
    print(os.listdir())

with change_dir("Sample-dir-two"):
    print(os.listdir())
```

## grep
```bash
grep "Yixian" name.txt
grep -w "Yixian" name.txt
grep -wi "Yixian" name.txt
grep -win "Yixian" name.txt
grep -win -B 4 "Yixian" name.txt
grep -win -A 4 "Yixian" name.txt
grep -win -C 2 "Yixian" name.txt
```

```bash
grep -win "Yixian" ./*.txt
```

```bash
grep -winr "Yixian" .
```

```bash
grep -wirl "Yixian" .
```

```bash
grep -wirc "Yixian" .
```

```bash
history | grep "git commit"
history | grep "git commit" | grep "dotfile"
```

```bash
grep "...-...-...." phonenumber.txt
```

```bash
# Mac
egrep "\d{3}-\d{3}-\d{4}" name.txt

# Linux
grep -P "\d{3}-\d{3}-\d{4}" name.txt
```

## emacs vc
```bash
c-x v // show cv options

c-x vv // next action
c-x vL // log
```

## emacs magit
```bash
c-x m-g // show magit options
```

## c++ STL
```c++
// reverse a string
std::reverse(s.begin(), s.end());

// to lower case
std::transform(
  std::begin(s),
  std::end(s),
  std::begin(s),
  ::tolower
);

// left part are all even numbers, right part are all odd numbers
std::partition(
  nums.begin(),
  nums.end(),
  [](auto e) {
    return e % 2 == 0;
  }
);

// move all 0's to the end while maintaining the relative order of non-zero elements
std::stable_partition(
  nums.begin(),
  nums.end(),
  [](auto e) {
    return e % 2 != 0;
  }
);

// std::sort -> std::partial_sort -> std::nth_element
// kClosest -- version 1
std::vector<std::vector<int>> kClosest(std::vector<std::vector<int>>& points, int K) {
  std::sort(
    points.begin(),
    points.end(),
    [](auto const& a, auto const& b) {
      return std::sqrt(a[0] * a[0] + a[1] * a[1]) < std::sqrt(b[0] * b[0] + b[1] * b[1]);
      // return a[0] * a[0] + a[1] * a[1] < b[0] * b[0] + b[1] * b[1]; // better performance
    }
  );

  return std::vector(points.begin(), points.begin() + K);
}

// kClosest -- version 2 & 3
std::vector<std::vector<int>> kClosest(std::vector<std::vector<int>>& points, int K) {
  std::partial_sort( // std::nth_element( is the partial_sort give top K elements but not in sorted order
    points.begin(),
    points.begin() + K,
    points.end(),
    [](auto const& a, auto const& b) {
      return a[0] * a[0] + a[1] * a[1] < b[0] * b[0] + b[1] * b[1];
    }
  );

  return std::vector(points.begin(), points.begin() + K);
}

// squares of a sorted array
std::transform(
  A.begin(),
  A.end(),
  A.begin(),
  [] (auto e) {
    return e * e;
  }
);

std::sort(
  A.begin(),
  A.end()
);
```

## c++ concept && requires

The add() on line 8 is consuming a named concept, Number, using the requires clause. It takes two numbers as a parameter, which should be either integer or floating_point, and returns the sum of both numbers.

On line 16, another function, add2(), is defined, which takes two numbers as parameters and returns the sum, but uses an unnamed concept through the requires clause.

```c++
#include <iostream>
#include <concepts>
template <typename T>
concept Number = std::integral<T> || std::floating_point<T>;

template <typename T, typename U>
requires Number<T> && Number<U>
auto add(T a, U b) {
  return a+b;
}

template <typename T, typename U>
requires std::integral<T> || std::floating_point<T> &&\
         std::integral<U> || std::floating_point<U>

auto add2(T a, U b) {
  return a+b;
}

int main() {
  std::cout<<add(5,42.1f)<<'\n';
  std::cout<<add2(42.1f,5)<<'\n';
  return 0;
}
```




