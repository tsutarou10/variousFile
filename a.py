file = open('tweets.txt', 'r')
lines = file.readlines()
txt = ''
for l in lines:
    if l == '\n':
        continue
    else :
        txt += l

output_file = open('new_tweets.txt', 'w')
output_file.write(txt)
file.close()
output_file.close()
