+++
title = 'OOD'
date = 2023-10-24T03:10:46-04:00
+++

# Friendship Service
```python
class FriendshipService:
    
    def __init__(self):
        # do intialization if necessary
        self.follower = dict()
        self.following = dict()
   
    def getFollowers(self, user_id):
        # write your code here
        if user_id not in self.follower:
            return []

        return sorted(list(self.follower[user_id]))

    def getFollowings(self, user_id):
        # write your code here
        if user_id not in self.following:
            return []

        return sorted(list(self.following[user_id]))

    def follow(self, to_user_id, from_user_id):
        # write your code here
        if to_user_id not in self.follower:
            self.follower[to_user_id] = set()
        self.follower[to_user_id].add(from_user_id)

        if from_user_id not in self.following:
            self.following[from_user_id] = set()
        self.following[from_user_id].add(to_user_id)


    def unfollow(self, to_user_id, from_user_id):
        # write your code here
        if to_user_id in self.follower:
            if from_user_id in self.follower[to_user_id]:
                self.follower[to_user_id].remove(from_user_id)
        
        if from_user_id in self.following:
            if to_user_id in self.following[from_user_id]:
                self.following[from_user_id].remove(to_user_id)

```