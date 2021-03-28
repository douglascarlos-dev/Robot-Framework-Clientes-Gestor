import psycopg2
def limpa_banco():
    con = psycopg2.connect(host='localhost', database='clientesgestor', user='postgres', password='postgres')
    cur = con.cursor()
    sql = 'DELETE FROM public.clientes'
    cur.execute(sql)
    con.commit()
    cur.close()
    con.close()