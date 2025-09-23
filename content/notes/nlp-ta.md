+++
title = 'NLP TA'
date = 2025-09-16T00:25:50-04:00
draft = true
+++

## Multiclass Perceptron
Q1
Which statement about the multiclass perceptron convergence is correct?
(A) It always converges for any dataset, linearly separable or not.
(B) It only converges in a finite number of updates if the dataset is linearly separable.
(C) It never converges because classes are more than two.
(D) It converges if we reduce the learning rate over time.

Q2 Using lecture setup, we are training a multiclass perceptron with three classes y {1, 2, 3}.
Initialization: all weight vectors are zero w1 = [0, 0, 0], w2 = [0, 0, 0], w3 = [0, 0, 0].
Learning rate a=1.
Assuming default pred is y = 3.

We have three training examples:
f(x) = [0, 1, 0], y = 1
f(x) = [1, 1, 1], y = 2

Assumes sequential updates example 1 then example 2, after processing both examples once, what are the final weights?
(A) w1 = [-1, 0, -1], w2 = [1, 0, 1], w3 = [1, 1, 1]
(B) w1 = [-1, 0, -1], w2 = [1, 1, 1], w3 = [0, -1, 0]
(C) w1 = [0, 1, -1], w2 = [1, 0, 1], w3 = [1, 1, 1]
(D) w1 = [-1, 0, -1], w2 = [0, 0, 0], w3 = [1, 1, 1]

### Answer && Explanations

Q1 Correct answer: B. Like the binary perceptron, the multiclass perceptron has a convergence guarantee only when the dataset is linearly separable with a positive margin. For non-separable data, it may update indefinitely.

Q2 Correct answer: B.
example 1: all 0, default y=3, wrong, update w1 = [0, 1, 0], w3 = [0, -1, 0]
example 2: s1 = 1, s2 = 0, s3 = -1, predict y = 1, wrong, update w1 = [-1, 0, -1], w2 = [1, 1, 1]

## Multiclass classification
Which of the following best describes the difference between multiclass perceptron and logistic regression updates?

(A) Perceptron updates only when the prediction is wrong, logistic regression updates on every example using the gradient of log loss.
(B) Logistic regression never updates, only perceptron updates.
(C) Both algorithms update identically but with different learning rates.
(D) Logistic regression requires linear separability for convergence, perceptron does not.

### Answer && Explanations
Correct answer: A. Perceptron is mistake-driven (updates only on misclassified examples). Logistic regression updates continuously using the gradient of negative log-likelihood, even when predictions are correct but uncertain.

<!-- Q1
Which of the following best contrasts the multiclass perceptron with softmax (multinomial logistic regression)?
(A) The perceptron uses probabilistic outputs, while logistic regression is deterministic.
(B) Logistic regression updates are local and mistake-driven, while perceptron updates are gradient-based.
(C) The perceptron is mistake-driven and non-probabilistic, while logistic regression optimizes a probabilistic loss function.
(D) Both produce identical predictions but differ only in efficiency. -->

<!-- Q3
Suppose we have three bag-of-words feature[good, bad, not] and the examples (good +, not good -, bad -)
Use the decision rule wTf(x) > 0, so a score of zero gets assigned the negative class.
Assume your initial w = [2, 2, 2], a = 1.
Simulate the perceptron learning process. After how many epochs will the algorithm converge? (i.e. on epoch 5, all classified correctly, no updates)
(A) 4 (B) 5 (C) 6 (D) 7 -->


<!-- Q2 Correct answer: C. The perceptron is non-probabilistic and only updates when a mistake occurs. Logistic regression uses probabilistic modeling with softmax and cross-entropy loss, updating weights with gradient descent for all examples. -->

<!-- Q3 Correct answer: B. 
f(x): "good": [1, 0, 0] "not good": [1, 0, 1] "bad": [0, 1, 0]
epoch 1: 
"good" +1, wTf(x) = 2, correct, no update 
"not good" -1, wTf(x) = 4, wrong, update  w = [2, 2, 2] + (-1) * [1, 0, 1] = [1, 2, 1] 
"bad" -1, wTf(x) = 2, wrong, update w = [1, 1, 1]

epoch 2: 
wTf(x) = 1, correct
wTf(x) = 2, wrong, update w = [0, 1, 0] 
wTf(x) = 1, wrong, update w = [0, 0, 0]

epoch 3: 
wTf(x) = 0, wrong, update w = [1, 0, 0] 
wTf(x) = 1, wrong, update w = [0, 0, -1]
wTf(x) = 0, correct

epoch 4: 
wTf(x) = 0, wrong, update w = [1, 0, -1] 
wTf(x) = 0, correct 
wTf(x) = 0, correct

epoch 5: 
wTf(x) = 1, correct 
wTf(x) = 0, correct 
wTf(x) = 0, correct -->
