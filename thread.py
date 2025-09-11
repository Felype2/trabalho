#importacao de biblioteca

@usamos a threading para criar e importar threads 
import threading 
@usamos o time para ativar o modo sleep
import time
@serve para ativar a matematica no codigo
import math

#Estrutura de Thread
@cria uma funçaõ para a thread no caso 3 funcoes no nosso codigo nome, inicio e file
def EstruturaThread (nome, inicio, file)
@serve para criar um loop do inicio ao fim
for i in range(inicio, fim +1):
    print(f"{nome}) -> {i}")
@serve para dar um intervalo no codigo
    time.sleep(10)

@é para criar a thread na funcao da EstruturaThread de 1 a 10
thread1 = threading.Thread(target=EstruturaThread, args=("Thread1", 1, 10))
@é para criar a thread na funcao da EstruturaThread de 50 a 60
thread2 = threading.Thread(target=EstruturaThread, args=("Thread1", 50, 60))

@inicia a thread para o codigo poder rodar
thread1.start()
thread2.start()
