#importacao de biblioteca

import threading #usamos a threading para criar e importar threads 
import time #usamos o time para ativar o modo sleep
import math #serve para ativar a matematica no codigo

#Estrutura de Thread
def EstruturaThread (nome, inicio, file) #cria uma funçaõ para a thread no caso 3 funcoes no nosso codigo nome, inicio e file
for i in range(inicio, fim +1): #serve para criar um loop do inicio ao fim
    print(f"{nome}) -> {i}") #imprime o nome da thread e o numero atual do loop
    time.sleep(10) #serve para dar um intervalo no codigo

thread1 = threading.Thread(target=EstruturaThread, args=("Thread1", 1, 10)) #é para criar a thread na funcao da EstruturaThread de 1 a 10
thread2 = threading.Thread(target=EstruturaThread, args=("Thread1", 50, 60)) #é para criar a thread na funcao da EstruturaThread de 50 a 60

thread1.start() #inicia a thread para o codigo rodar
thread2.start() #inicia a thread para o codigo rodar
