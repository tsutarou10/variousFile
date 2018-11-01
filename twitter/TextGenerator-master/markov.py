#coding:utf-8
from PrepareChain import PrepareChain
from GenerateText import GenerateText

class Markov:
    def generate(self):
        file = open('../twitter_data/new_tweets.txt', 'r')
        text = u''
        lines = file.readlines()
        for line in lines :
            text += unicode(line, 'utf-8')
        chain = PrepareChain(text)
        triplet_freqs = chain.make_triplet_freqs()
        chain.save(triplet_freqs, True)


        generator = GenerateText()
        rsl =  generator.generate()
        print rsl
        file.close()
        return rsl

