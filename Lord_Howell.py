from random import Random
from itertools import islice

r=Random(200003028)
rechr = lambda i: '' if not i else chr(i)

payload = list(islice((r.randint(0,19)+100 for _ in range(12807089)), 12807080, 12807089))
payload.append(0)
payload[0:7:4] = [i ^ 0b100000 for i in payload[0:7:4]]
payload.insert(4, '')

data = [0]*8
data.insert(2, 0x6c)
data.insert(4, 0o40)
data.insert(-1, 0o41)
data.insert(4, 0o54)

print(''.join(rechr(i) for i in sum(list(zip(data, payload)), ())))
