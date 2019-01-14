#!/usr/bin/env python3

"""Add System Users
<Username>:<Password>:<UID>:<GID>:<User Info>:<Home Dir>:<Default Shell>

user1:user1@123:601:601:User 1:/home/user1:/bin/bash
user2:user2@123:602:602:User 2:/home/user2:/bin/bash
user3:user3@123:603:603:User 3:/home/user3:/bin/bash
user4:user4@123:604:604:User 4:/home/user4:/bin/bash
user5:user5@123:605:605:User 5:/home/user5:/bin/bash

"""
user = 'user'
f = open("new-users.txt", "w+")

for i in range(2000, 2050):
    this_user = '{}{}'.format(user, str(i).zfill(3))
    l = '{}:password:{}:{}:{}:/home/{}:/bin/bash'.format(this_user, i, i, this_user, this_user)
    f.write(l)
    f.write("\n")

f.close()
