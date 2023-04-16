import torch
from pyvi import ViTokenizer
from transformers import RobertaForSequenceClassification, AutoTokenizer

model = RobertaForSequenceClassification.from_pretrained("wonrax/phobert-base-vietnamese-sentiment")

tokenizer = AutoTokenizer.from_pretrained("wonrax/phobert-base-vietnamese-sentiment", use_fast=False)

# Just like PhoBERT: INPUT TEXT MUST BE ALREADY WORD-SEGMENTED!
def sentiment(sentence):
    tokens = ViTokenizer.tokenize(sentence)
    print(tokens)
    input_ids = torch.tensor([tokenizer.encode(sentence)])

    with torch.no_grad():
        out = model(input_ids)
        tensor = out.logits.softmax(dim=-1)
    return tensor.tolist()[0][:3]
