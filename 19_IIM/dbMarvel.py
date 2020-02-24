import pymysql
 
class Database():
    def __init__(self): #MySQL 서버와 연결
        self.db= pymysql.connect(host='127.0.0.1', port= 3306,
                                  user='root',
                                  password='1293',
                                  db='marvel',
                                  charset='utf8')
        self.cursor= self.db.cursor(pymysql.cursors.DictCursor)


    def logcheck(self,id,password): #Customer Table에서 입력받은 ID와 PW에 해당하는 정보를 가져오게함. 
        sql = "select FullName from customer WHERE CustomerID=%s AND EncryptedPassword= %s"
        result = self.cursor.execute(sql,(id,password))
        name = self.cursor.fetchone()
        if result ==0:
            return False 
        else :
            return True, name

    def getmylist(self,CustomerID): #REVIEW Table에서 입력받은 CustomerID의 사용자가 시청한 영화 정보를 불러옴
        sql ="""select MOVIE.Title, Series, World_View_Order
                from MOVIE, REVIEW
                where REVIEW.CustomerID = %s and REVIEW.Title = MOVIE.Title"""
        self.cursor.execute(sql,(CustomerID))
        data = self.cursor.fetchall()
        return data

    def movie_quotes(self, Movie): #MOVIE_QOTES Table에서 입력받은 Movie에서 등장하는 명대사와 해당 인물 정보를 불러
        sql = "select Heroname, Famous_Line from MOVIE_QUOTES where Movie = %s; "

        curs = self.db.cursor(pymysql.cursors.DictCursor)
        result = curs.execute(sql, (Movie))
        famous_line = curs.fetchall()
#        famous_line = pymysql.cursors.DictCursor()
        if result == 0:
            return False
        else:
            return result, famous_line
        
    def filmography(self, Actor): #FILMOGRAPHY Table에서 입력받은 Actor의 다른 출연작 정보를 가져옴
        sql = 'select AnotherMovie, CharacterName, MovieYear, Genre from FILMOGRAPHY where Actor = %s order by MovieYear;'
        result = self.cursor.execute(sql, (Actor))
        filmography = self.cursor.fetchall()
        return result, filmography
        
    def insert_review(self, CustomerID, Title, Score): #CustomerID, 영화 Title, Customer의 영화 평점 정보를 REVIEW Table에 Insert해서 Transaction을 발생시킴
        sql = 'INSERT INTO REVIEW VALUES (%s, %s, %s);'
        self.cursor.execute(sql,(CustomerID, Title, Score))
        self.db.commit()
        
    def calculate_review(self, Title): #REVIEW Table에서 입력받은 영화 이름에 대한 평균 평점을 계산
        sql = 'select Title, avg(Score) as Grade from REVIEW where Title = %s group by Title;'
        result  = self.cursor.execute(sql, (Title))
        cal = self.cursor.fetchall()
        return result, cal
    
    def movie_hero(self, Title): #입력받은 Title의 영화에 등장하는 Hero 정보를 불러옴 
        sql = 'select HeroName, Actor from MOVIE_has_HERO where Title = %s;'
        result = self.cursor.execute(sql, (Title))
        view = self.cursor.fetchall()
        str_list = ""
        for i in view:
            k = "{} | {} ".format(i['HeroName'].replace('_', ' '), i['Actor'].replace('_', ' '))
            str_list = str_list + k + '\n' 
        return str_list
        
    def select_review(self, Title, CustomerID): #입력받은 CustomerID의 사용자가 남긴 영화에 대한 후기 점수를 불러옴 
        sql = 'select Score from REVIEW where Title = %s and CustomerID = %s;'
        result = self.cursor.execute(sql, (Title, CustomerID))
        cal = self.cursor.fetchone()
        return result, cal
    
    def seen_count(self, CustomerID): #입력받은 CustomerID의 사용자가 총 몇개의 영화를 보았는지 알려줌
        sql = 'select count(*) as counts from REVIEW group by CustomerID having CustomerID = %s;'
        result = self.cursor.execute(sql, (CustomerID))
        total = self.cursor.fetchone()
        return total
    
    def unseen_count(self, CustomerID): #입력받은 CustomerID의 사용자가 총 몇개의 영화를 보지 않았는지 알려줌
        sql = 'SELECT count(*) as counts FROM MOVIE Where Title not in (SELECT Title FROM REVIEW WHERE CustomerID = %s) and Rotten_Tomato is not NULL;'
        result = self.cursor.execute(sql, (CustomerID))
        total = self.cursor.fetchone()
        return total
    
    def not_yet_seen_movie2(self,CustomerID): #입력받은 CustomerID의 사용자가 보지 않은 영화들의 정보를 불러옴 
        sql = 'SELECT Title, World_View_Order, Series, Director, RunningTime, Rotten_Tomato, Release_date FROM MOVIE WHERE Title not in (SELECT Title FROM REVIEW WHERE CustomerID = %s) order by World_View_Order ASC, Release_date ASC ;'
        result = self.cursor.execute(sql, (CustomerID))
        not_yet_seen = self.cursor.fetchall()
        return result, not_yet_seen
    
    def not_yet_seen_movie3(self,CustomerID, HeroName): #입력받은 CustomerID의 사용자가 보지 않은 영화들의 정보를 불러옴 
        sql = 'SELECT MOVIE.Title, World_View_Order, Series, Director, RunningTime, Rotten_Tomato, Release_date FROM MOVIE, movie_has_hero WHERE MOVIE.Title = movie_has_hero.Title and MOVIE.Title not in (SELECT Title FROM REVIEW WHERE CustomerID = %s) and HeroName = %s order by World_View_Order ASC, Release_date ASC ;'
        result = self.cursor.execute(sql, (CustomerID, HeroName))
        not_yet_seen = self.cursor.fetchall()
        return result, not_yet_seen

    def seen_movie(self, CustomerID): #입력받은 CustomerID의 사용자가 본 영화들의 정보를 불러옴 
        sql = 'SELECT MOVIE.Title, World_View_Order, Series FROM MOVIE, REVIEW WHERE MOVIE.Title = REVIEW.Title and REVIEW.CustomerID = %s ORDER by World_View_Order ASC;'
        result = self.cursor.execute(sql, (CustomerID))
        seen = self.cursor.fetchall()
        return result, seen
    
    def movie_percent(self, CustomerID): #입력받은 CustomerID의 사용자가 본 영화들에 대해, 각 영화 시리즈 별로 몇개의 영화 중 몇개의 영화를 보았는지 정보를 str 형태로 출력함
        sql_all = 'select Series, count(*) as Total from MOVIE where Rotten_Tomato is not null group by Series order by Series asc;' 
        result_all = self.cursor.execute(sql_all)
        total = self.cursor.fetchall()
        print('total::', total)
        
        sql_cus = 'SELECT Series, count(*) as Total FROM MOVIE WHERE Title in (SELECT Title FROM REVIEW WHERE CustomerID = %s) and Rotten_Tomato is not null group by Series order by Series asc;'
        result_cus = self.cursor.execute(sql_cus, (CustomerID))
        custom = self.cursor.fetchall()
        check_list = []

        total2 = {}
        for i in total:
            total2[i['Series']] = i['Total']
        custom2 = {}
        for i in custom:
            custom2[i['Series']] = i['Total']

        
        for i in custom2 :
            check_list.append(i)
        for i in total2 :
            if i not in check_list:
                custom2[i] = 0
      
        
        acheive_dict = {}
        
        
        for i in total2.keys():
            
            alll = total2[i]
            my = custom2[i]
            
            percent = '{} / {}'.format(my, alll)
            acheive_dict[i] = percent
        
        str_list = ""
        tail = "{} :: {} ".format('Etc', acheive_dict['etc'])        
        for i in acheive_dict.keys():            
            
            if i == 'etc':
                continue
            
            k = "{} series :: {} ".format(i,acheive_dict[i])
            str_list = str_list + k + '\n' 
        
        str_list = str_list + tail
        return str_list
        
    
    def execute(self, query, args={}):
        self.cursor.execute(query, args) 
 
    def executeOne(self, query, args={}):
        self.cursor.execute(query, args)
        row= self.cursor.fetchone()
        return row
 
    def executeAll(self, query, args={}):
        self.cursor.execute(query, args)
        row= self.cursor.fetchall()
        return row
 
    def commit():
        self.db.commit()