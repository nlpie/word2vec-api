word2vec-api
============

Simple web service providing a word embedding API. The methods are based on Gensim Word2Vec implementation. Models are passed as parameters and must be in the Word2Vec text or binary format. 

NLPIE is using the PMC Corpus (see below).

* Build docker image   
```
docker build -t horcle/w2v .
```

* Launching the service (aka, running the Docker container)
```
docker run -it -v /path/2/word2vec/model:/data -p 5000:5000 horcle/w2v
```



* Example calls
```
curl "http://127.0.0.1:5000/word2vec/n_similarity?ws1=data&ws1=science&ws2=computer&ws2=science"
curl "http://127.0.0.1:5000/word2vec/similarity?w1=computer&w2=science"
curl "http://127.0.0.1:5000/word2vec/most_similar?positive=paris"
curl "http://127.0.0.1:5000/word2vec/model?word=restaurant"
curl "http://127.0.0.1:5000/word2vec/model_word_set"
```

Note: The "model" method returns a base64 encoding of the vector. "model\_word\_set" returns a base64 encoded pickle of the model's vocabulary. 

## Where to get a pretrained model

In case you do not have domain specific data to train, it can be convenient to use a pretrained model. 
Please feel free to submit additions to this list through a pull request.

** As part of the NLPIE, we are using the Pubmed Central corpus
 
| Model file | Number of dimensions | Corpus (size)| Vocabulary size | Author | Architecture | Training Algorithm | Context window - size | Web page |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| [Pubmed Central](https://www.ncbi.nlm.nih.gov/pmc/tools/ftp/) | TBD | (TBD) | NLM/NIH | ? | word2vec | negative sampling | BoW - ~5| [link](https://www.ncbi.nlm.nih.gov/pmc/tools/ftp/) |


