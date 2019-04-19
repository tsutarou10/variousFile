file = open('./twitter_data/tweets.txt', 'r')
lines = file.readlines()
txt = ''
for l in lines:
    if l == '\n' or (l[0] == 'R' and l[1] == 'T') or l[0] == '#':
        continue
    else :
        txt += l

output_file = open('./twitter_data/new_tweets.txt', 'w')
output_file.write(txt)
file.close()
output_file.close()
