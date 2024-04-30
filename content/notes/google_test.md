+++
title = 'Google Test'
date = 2023-11-09T20:44:40-05:00
+++

## Install without Homebrew
```
git clone https://github.com/google/googletest
cd googletest
mkdir build
cd build
cmake ..
make
make install
```

> `-lgtest -lgtest_main -pthread`


## Example
```c++
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <iostream>
#include <algorithm>
#include <vector>
#include <tuple>

#define print(x) std::ranges::copy(x, std::ostream_iterator<int>(std::cout, " ")); std::cout << std::endl

namespace testing {

TEST(Testname, Subtest_1) {
  int vali = 1;
  ASSERT_TRUE(vali == 1);

  std::vector<int> vec{5, 10, 15};
  EXPECT_THAT(vec, ElementsAre(5, 10, 15));

  std::string vals = "apple";
  EXPECT_STREQ(vals.c_str(), "apple");

  std::tuple<int, std::string, double, std::vector<int>> my_tuple{7, "hello world", 1.2, vec};
  EXPECT_THAT(my_tuple, FieldsAre(Ge(0), HasSubstr("hello"), Eq(1.2), ElementsAre(5, 10, 15)));

  int a;
  std::string b;
  std::tie(a, b, std::ignore, std::ignore) = my_tuple;
  std::cout << std::get<2>(my_tuple) << std::endl;

}

} // namespace testing

int main(int argc, char **argv) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}


```