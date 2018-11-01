import csv
import re
import codecs

output_txt = u''
output_file = codecs.open('tweets.txt', 'w', 'utf-8')

with open('tweets.csv', 'r') as f :
    reader = csv.reader(f)
    header = next(reader)
    pattern = '[\^@.*]'
    repatter = re.compile(pattern)
    pattern2 = '.*http.*'
    repatter2 = re.compile(pattern2)
    pattern3 = '.*#.*'
    repatter3 = re.compile(pattern3)

    for row in reader :
        tmp = row[5].split(' ')
        tmp_txt = ''
        for t in tmp :
            t = unicode(t, 'utf-8')
            match = repatter.match(t)
            match2 = repatter2.match(t)
            match3 = repatter3.match(t)
            if match or match2 or match3 :
                print t
            else :
                tmp_txt += t + ' '

        output_txt += tmp_txt + '\n'

    output_file.write(output_txt)
    output_file.close()
