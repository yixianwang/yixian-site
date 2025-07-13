+++
title = 'BRE Drools'
date = 2025-07-13T10:34:42-04:00
+++

## Syntax
```
📘 RULE STRUCTURE
────────────────────────────
rule "Rule Name"
when
  // CONDITIONS (LHS)
  $fact : Class(field == value)
  not(Class(field != value))
  exists(Class(field > 100))
  eval(customMethod($fact))
  accumulate(...)

then
  // ACTIONS (RHS)
  System.out.println($fact);
  modify($fact) { setField("new value") }
  insert(new Fact(...))
  retract($fact)
end
```
### General Syntax of the when block
```
when
  // pattern
  $var: SomeFactType(field1 == "value", field2 > 10)

  // condition only (no binding)
  SomeOtherType(field3 matches "regex.*")

  // logical combinations
  eval(someJavaMethod($var))

  // negation, existence
  not(SomeType(...))
  exists(SomeType(...))

  // temporal logic (for CEP)
  EventA()
  EventB(this after[0s,10s] EventA())
```

1. Fact Pattern Matching
```
$person: Person(age > 18, name == "Alice")
```
- `Person`: class name (fact type)
- `$person`: variable binding (optional). You can refer to this in `then`.
- `age > 18`, `name == "Alice"`: field constraints (support most Java expressions)

2. Binding Variables
```
$amount: Order(amount > 1000)
```
- Binds the `Order` fact to `$amount` so you can use it in the `then` block.

```
Order($value: amount)
```
- This binds `amount` field to `$value` directly.

3. Logical Operators in Constraints
> inside a pattern
- ==, !=, <, >, >=, <=, &&
- in (1, 2, 3)
- not in (1, 2, 3)
- matches
- contains

4. not, exist, forall
These add *logical negation or existential conditions*:
```
not(Person(age < 18))           // No person under 18 exists
exists(Order(amount > 1000))    // At least one order > 1000 exists
forall(Person(age > 18))        // All Persons must satisfy age > 18
```

5. eval() - Arbitrary Java Expressions
```
eval(someCustomCheck($person))
```
Use this if you need complex logic that's not easily expressed in patterns.
> ⚠️ Try to avoid eval() unless necessary — it breaks indexing and slows down performance.

6. Accumulate(Aggregate Matching)
```
accumulate(
  $o: Order(amount > 100),
  $sum: sum($o.amount)
)
```
Other functions: `count()`, `average()`, `collectList()`, etc.

Example:
```
rule "VIP Alert"
when
  $c: Customer(type == "VIP", $spent: totalSpent > 1000)
  not(BanList(name == $c.name))
  accumulate(
    Order(customer == $c) over window:time(10m),
    $count: count()
  )
  eval($count >= 3)
then
  System.out.println("Alert: VIP customer " + $c.getName() + " made 3+ orders in 10 min!");
end
```
