import tkinter as tk
from tkinter import ttk
#from tkinter import filedialog
import dbMarvel
import tkinter.messagebox
import webbrowser
def callback(url):
    webbrowser.open_new(url)
    
def Title_Refresh(x): #Title 선택 변경 시 글자가 overlap되는 현상을 해결하기 위한 함
    if len(x)<50:
        return x + (50-len(x))*' ' 
    else:
        return x

def Open_or_Not(x): #Not seen yet 박스에서 Title 선택 시 해당 영화가 개봉하지 않았다면 경고 메세지를 함께 Choice Box에 출력하기 위한 함수
    if x['World_View_Order'] == 9999:
        return x['Title'] + ' ※Warning:: Not Coming'
    else:
        return x['Title']


class Counter_program():
    
    def __init__(self, db): #초기 인터페이스 설정 
        self.window = tk.Tk()
        self.window.title("MCU for you")
        self.window.resizable(True, True)
        self.window.state("zoomed")
        self.F1 = tk.Frame(self.window)
        self.F1.grid(row=0)
        
        self.frame1 = tk.Frame(self.window)
        self.photo1 = tk.PhotoImage(file="sample4.png") #App 배경화면
        background_label = tk.Label(self.window, image= self.photo1)
        background_label.place(x=0, y=0, relwidth=1, relheight=1)
        
        self.window.geometry("1920x1080+0+0") #초기 App 크기 설정 
        self.create_widgets()
        self.db=db        
        
        self.style = ttk.Style()
        self.style.configure("BW.TLabel", foreground="white", background="black", fieldbackground="black" )
        
        self.radio_variable = tk.StringVar()
        self.combobox_value = tk.StringVar()
        
    
    def login_success(self): # Login 성공 시 Login 박스, Not seen yet, Seen Movie 박스를 입력받은 Customer에 대해 조회
        self.ID_str = self.ID_entry.get()

        Password_str = self.PW_entry.get()
        self.ID_entry.delete(0,tk.END)
        self.PW_entry.delete(0,tk.END)
        check,name = self.db.logcheck(self.ID_str,Password_str)
        print(check)
        if check :
            
            Welcome = ttk.Label(self.Log_frame, text="Welcome "+name["FullName"], style="BW.TLabel")
            Welcome.config(font=("나눔스퀘어", 15))
            Welcome.grid(row=4, column=2, sticky=tk.W + tk.E, pady=3)
            
            process_button = ttk.Button(self.Log_frame, text="Detail Status",  command = self.process_check, cursor="hand2", style="BW.TLabel")
            process_button.grid(row=5, column=3)
            
            link1 = tk.Label(self.Log_frame, text="About MCU", fg="white", bg = 'black', cursor="hand2")
            link1.grid(row=6, column=3)
            link1.bind("<Button-1>", lambda e: callback("https://www.marvel.com/movies"))
            
        self.refresh_table()
        self.refresh_table2()
        
    def process_check(self): # More info 버튼을 눌렀을 때 시리즈별 시청 진행 상황을 알려주는 팝업 띄우기 
        tkinter.messagebox.showinfo( "Progress per Series", self.db.movie_percent(self.ID_str) )
    
    
    def refresh_table(self): # Not seen yet 박스 안의 Table(Treeview라고 함)을 채워주고, Login Box 안의 영화 시청 상황을 알려주는 두 줄을 띄워줌 
        num, self.data = self.db.not_yet_seen_movie2(self.ID_str)
        for i in range(num):
            self.treeview.insert('', 'end', text = " ", values=tuple(self.data[i].values()), iid=str(i))
        
        
        self.total = self.db.seen_count(self.ID_str)
        Status = ttk.Label(self.Log_frame, text = "You've watched {} movies".format(self.total['counts']), style ="BW.TLabel")
        Status.grid(row = 5, column = 2, sticky = tk.W + tk.E, pady = 3)
        
        self.left = self.db.unseen_count(self.ID_str)
        Status2 = ttk.Label(self.Log_frame, text = "Need to watch {} more".format(self.left['counts']), style ="BW.TLabel")
        Status2.grid(row = 6, column = 2, sticky = tk.W + tk.E, pady = 3)  

    def refresh_table3(self): # Not seen yet 박스 안의 Table(Treeview라고 함)을 채워주고, Login Box 안의 영화 시청 상황을 알려주는 두 줄을 띄워줌 
        num, self.data = self.db.not_yet_seen_movie(self.ID_str)
        for i in range(num):
            self.treeview.insert('', 'end', text = " ", values=tuple(self.data[i].values()), iid=str(i))
        
        
        self.total = self.db.seen_count(self.ID_str)
        Status = ttk.Label(self.Log_frame, text = "You've watched {} movies".format(self.total['counts']), style ="BW.TLabel")
        Status.grid(row = 5, column = 2, sticky = tk.W + tk.E, pady = 3)
        
        self.left = self.db.unseen_count(self.ID_str)
        Status2 = ttk.Label(self.Log_frame, text = "Need to watch {} more".format(self.left['counts']), style ="BW.TLabel")
        Status2.grid(row = 6, column = 2, sticky = tk.W + tk.E, pady = 3)  

    def treeview_2_delete(self): #Movie Quotes 박스 안의 Treeview를 필요시 비워줌
        for i in self.treeview_2.get_children():
            self.treeview_2.delete(i)

    def treeview_3_delete(self): #Filmography 박스 안의 Treeview를 필요시 비워줌 
        for i in self.treeview_3.get_children():
            self.treeview_3.delete(i)
 
    def OnDoubleClick(self, event): #Not seen yet 박스 안의 Treeview의 한 row를 클릭할 때 Choice Frame에 영화 제목을 띄워주고, 팝업을 띄우고, 명대사를 해당 영화에 맞게 보여줌  
        item = self.treeview.selection()[0]
        print("you clicked on", self.treeview.item(item,"text")) 
        
        self.treeview_2_delete()
        
        Setect_Title = ttk.Label(self.switch_frame, text= Title_Refresh( Open_or_Not(self.data[int(item)]) ), style="BW.TLabel")
        Setect_Title.grid(row=1, column=1, sticky=tk.W, pady=3)
        
        tkinter.messagebox.showinfo( "Hero Line-up", "{}".format(self.db.movie_hero( self.data[int(item)]['Title'])))  
        self.callback(self.data[int(item)]['Title'])
        
    def callback(self, selection): #해당 영화에 맞는 명대사를 MOVIE QUOTES의 Treeview 안에 채워줌 
        check, quotes = self.db.movie_quotes(selection)
        for i in range (check):
            self.treeview_2.insert('', 'end', text=i, values=tuple(quotes[i].values()), iid=str(i))
        print(quotes)       
        
        
    def refresh_table2(self): #Seen Movie 박스의 Treeview를 채워줌 
        num2, self.seendata = self.db.seen_movie(self.ID_str)
        
        self.treeview2.delete(*self.treeview2.get_children())
        
        print(self.seendata)
        for k in range(num2):
            self.treeview2.insert('', 'end',text = " ", values=tuple(self.seendata[k].values()), iid=str(k))        


    def OnDoubleClick_REVIEW(self, event): #Seen Movie 박스 Treeview의 한 row를 클릭했을 때, Review 박스에 제목 / 영화 정보(출연진) / 나의 점수 / 관람객들 평균 평점을 띄움
        item = self.treeview2.selection()[0]
        print("you clicked on", self.treeview2.item(item,"text")) 
        
        num, self.reviewdata = self.db.calculate_review(self.seendata[int(item)]['Title']) #average score 불러오기
        avg = self.reviewdata[0]['Grade']
        
        num2, self.mydata = self.db.select_review(self.seendata[int(item)]['Title'], self.ID_str)
        
        
        Setect_Title = ttk.Label(self.REVIEW_frame, text= Title_Refresh(self.seendata[int(item)]['Title']), style="BW.TLabel")
        Setect_Title.config(font=("나눔스퀘어", 18))
        Setect_Title.grid(row=1, column=1, sticky=tk.W, pady=3)
        
        
        Average_label = ttk.Label(self.REVIEW_frame, text = "Grade :: {}".format( avg ), style="BW.TLabel")
        Average_label.grid(row=4, column=1, sticky=tk.E + tk.W + tk.N + tk.S, pady=3)
        
        My_label = ttk.Label(self.REVIEW_frame, text = "My Score:: {}".format( self.mydata['Score'] ), style="BW.TLabel")
        My_label.grid(row = 3, column = 1, sticky=tk.E + tk.W + tk.N + tk.S, pady=0)
        
        Info_label = ttk.Label(self.REVIEW_frame, text = self.db.movie_hero( self.seendata[int(item)]['Title']) , style="BW.TLabel")
        Info_label.grid(row = 2, column = 1, sticky=tk.E + tk.W + tk.N + tk.S, pady=0)
        Info_label.config(font=("맑은 고딕", 7))
        
        community_link = tk.Label(self.window, text="Community", fg = "white", bg = "black", cursor="hand2")
        community_link.place(x= 870, y= 500)
        community_link.bind("<Button-1>", lambda e: callback("http://knowhere-mcu.proboards.com/"))
        
    def delete(self): # Not seen yet의 Treeview를 비워줌
        for i in range(len(self.data)):
            self.treeview.delete(i)
        
        
    def delete2(self): # Seen movie의 Treeview를 비워줌 
        for i in range(len(self.seendata)):
            self.treeview2.delete(i)

    def delete_3(self): # Filmography의 Treeview를 비워줌 
        for i in range(len(tk.END)):
            self.treeview_3.delete(i)       

    def get_review(self): # choice 박스에서 입력받은 점수를 가지고 Not seen yet Treeview에서 해당 영화 제거 / Seen movie에 추가 - 이 작업에서 Treeview를 비워주고 다시 채워야 하기에 delete와 refresh가 둘 다 들어가는것임.
        Score = self.Score_entry.get()
        self.Score_entry.delete(0,tk.END)
        num = self.treeview.selection()[0]
        
        db.insert_review(self.ID_str ,self.data[int(num)]['Title'], Score)
        self.helloCallBack(self.data[int(num)]['Title'])
        
        self.delete()
        self.delete2()
        
        self.refresh_table()
        self.refresh_table2()
        
    def helloCallBack(self,title=None): # choice 박스에서 점수를 입력하고 get 버튼을 누르면 알림 메세지를 띄워
        print(title)
        if title == None:
            tkinter.messagebox.showinfo( "Message", "Yon need to watch movie")        
        else:
            tkinter.messagebox.showinfo( "Message", "Yon watched "+ title)  


    def create_widgets(self): # App 내의 박스들과 기본 Text를 배치함
        # Create some room around all the internal frames
        self.window['padx'] = 0
        self.window['pady'] = 0

        # - - - - - - - - - - - - - - - - - - - - -
        # The Login frame

        self.Log_frame = tk.LabelFrame(self.window,text="Login", relief=tk.RIDGE, foreground="white", background="black", height = 0)
        self.Log_frame.grid(row=1, column=1, sticky=tk.E + tk.W + tk.N + tk.S)
        
        App_Title = ttk.Label(self.Log_frame, text = " MCU for you!", style = "BW.TLabel")
        App_Title.grid(row =1, column =1, sticky=tk.W, pady = 3)
        App_Title.config(font=("Imprint MT Shadow", 20))
        
        ID_label = ttk.Label(self.Log_frame, text="CustomerID ", style="BW.TLabel")
        ID_label.grid(row=2, column=1, sticky=tk.E, pady=3)

        PW_label = ttk.Label(self.Log_frame, text="CustomerPW ", style="BW.TLabel")
        PW_label.grid(row=3, column=1, sticky=tk.E, pady=3)
        
        Empty = ttk.Label(self.Log_frame, text = "   ", style = "BW.TLabel")
        Empty.grid(row = 4, column =1, sticky = tk.W, pady = 3)
        
        self.ID_entry = ttk.Entry(self.Log_frame, width=30)
        self.ID_entry.grid(row=2, column=2, sticky=tk.W, pady=3)
        self.ID_entry.insert(tk.END, "2015147018")
        
        self.PW_entry = ttk.Entry(self.Log_frame, width=30)
        self.PW_entry.grid(row=3, column=2, sticky=tk.W, pady=3)
        self.PW_entry.insert(tk.END, "qwerty")
        

        Login_button = ttk.Button(self.Log_frame, text="  Log-In",  command=self.login_success, cursor="hand2", style="BW.TLabel")
        Login_button.grid(row=2, column=3)
        
        # - - - - - - - - - - - - - - - - - - - - -
        # Not seen yet
        self.entry_frame = tk.LabelFrame(self.window, text="Not seen yet", relief=tk.RIDGE , foreground="white", background="black", height = 200)
        self.entry_frame.grid(row=2, column=1, sticky=tk.E + tk.W + tk.N + tk.S)
        

        self.treeview=ttk.Treeview(self.entry_frame,  columns=["Title", "World_View_Order","Series",'Director','RunningTime','Rotten_Tomato','Release_date'], style = "BW.TLabel")        
        self.treeview.pack()
        
        self.treeview.column("#0", width=0)
        self.treeview.heading("#0", text=" ")
        
        self.treeview.column("Title", width=100, anchor="w")
        self.treeview.heading("Title", text="Title", anchor="center")
        self.treeview.bind("<Double-1>", self.OnDoubleClick)

        self.treeview.column("World_View_Order", width=60, anchor="w")
        self.treeview.heading("World_View_Order", text="World_View_Order", anchor="center")
        
        self.treeview.column("Series", width=100, anchor="w")
        self.treeview.heading("Series", text="Series", anchor="center")

        self.treeview.column("Director", width=100, anchor="w")
        self.treeview.heading("Director", text="Director", anchor="center")

        self.treeview.column("RunningTime", width=60, anchor="w")
        self.treeview.heading("RunningTime", text="RunningTime", anchor="center")

        self.treeview.column("Rotten_Tomato", width=60, anchor="w")
        self.treeview.heading("Rotten_Tomato", text="Rotten_Tomato", anchor="center")

        self.treeview.column("Release_date", width=100, anchor="w")
        self.treeview.heading("Release_date", text="Release_date", anchor="center")
        
        
        # - - - - - - - - - - - - - - - - - - - - -
        # Seem movie
        self.fromlist_frame = tk.LabelFrame(self.window, text="Seen movie",
                                        relief=tk.RIDGE, foreground="white", background="black", height = 200)
        self.fromlist_frame.grid(row=1, column=2, sticky=tk.E + tk.W + tk.N + tk.S, padx=6)
        self.fromlist_frame.grid_propagate(False)
        
        self.treeview2=ttk.Treeview(self.fromlist_frame, columns=["Title", "World_View_Order","Series"], style = "BW.TLabel")        
        self.treeview2.pack()
        
        self.treeview2.column("#0", width=0)
        self.treeview2.heading("#0", text=" ")
        
        self.treeview2.column("Title", width=100, anchor = "w")
        self.treeview2.heading("Title", text="Title", anchor="center")
        self.treeview2.bind("<Double-1>", self.OnDoubleClick_REVIEW)

        self.treeview2.column("World_View_Order", width=150, anchor="w")
        self.treeview2.heading("World_View_Order", text="World_View_Order", anchor="center")
        
        self.treeview2.column("Series", width=100, anchor="w")
        self.treeview2.heading("Series", text="Series", anchor="center")

        # - - - - - - - - - - - - - - - - - - - - -
        # Choices
        
        self.switch_frame = tk.LabelFrame(self.window, text="Choices", relief=tk.RIDGE,  foreground="white", background="black")
        self.switch_frame.grid(row=1, column=1, padx=6, sticky=tk.S) #tk.E + tk.W + tk.N + 

        Price_label = ttk.Label(self.switch_frame, text="Your Score", style="BW.TLabel")
        Price_label.grid(row=3, column=1, sticky=tk.W, pady=3)
        

        self.Score_entry = ttk.Entry(self.switch_frame, width=20) 
        self.Score_entry.grid(row=3, column=2, sticky=tk.W, pady=3)
        
        
        get_button = ttk.Button(self.switch_frame, text="  Get",  command=self.get_review , style="BW.TLabel", cursor="hand2")
        get_button.grid(row=3, column=3)

        # - - - - - - - - - - - - - - - - - - - - -
        # REVIEW 
        self.REVIEW_frame =tk.LabelFrame(self.window, text = "Reviews", relief = tk.RIDGE, height = 200, foreground="white", background="black")
        self.REVIEW_frame.grid_propagate(False)
        self.REVIEW_frame.grid(row = 2, column = 2, padx = 6, sticky=tk.E + tk.W + tk.N + tk.S)
        
        
        #--------------------------------
        # 여유 공간을 주기 위해 만든 코드니 신경 ㄴ
        self.empty_frame_2 = tk.LabelFrame(self.window, text=" ",
                                        relief=tk.RIDGE, foreground="white", background="black", height = 10, bd = 0)
        self.empty_frame_2.grid(row=3, column=1, sticky=tk.E + tk.W + tk.N + tk.S) 
        
        
        # Movie Quotes     
        self.fromlist_frame_2 = tk.LabelFrame(self.window, text="  Movie Quotes",
                                        relief=tk.RIDGE, foreground="white", background="black",  height = 200, bd = 0)
        self.fromlist_frame_2.grid(row=4, column=1, sticky=tk.E + tk.W + tk.N + tk.S) 
        
        self.treeview_2=ttk.Treeview(self.fromlist_frame_2, columns=["Heroname", "Famous_Line"], style = "BW.TLabel")        
        self.treeview_2.pack()
      
        self.treeview_2.column("#0", width=0)
        self.treeview_2.heading("#0", text="")
                                                                
        self.treeview_2.column("Heroname", width=100, anchor="w")
        self.treeview_2.heading("Heroname", text="Heroname", anchor="center")
        
        self.treeview_2.column("Famous_Line", width=480, anchor="w")
        self.treeview_2.heading("Famous_Line", text="Famous_Line", anchor="center")
                              
        # - - - - - - - - - - - - - - - - - - - - -
        # Filmography
        self.fromlist_frame_3 = tk.LabelFrame(self.window, text=" Filmography",
                                        relief=tk.RIDGE, foreground="white", background="black", height = 200, bd = 0)
        self.fromlist_frame_3.grid_propagate(False)
        self.fromlist_frame_3.grid(row=4, column=2, sticky=tk.E + tk.W + tk.N + tk.S)          
        
        
        self.treeview_3=ttk.Treeview(self.fromlist_frame_3, columns=["AnotherMovie","CharacterName","MovieYear","Genre"], style = "BW.TLabel", height = 50)        
        self.treeview_3.pack()
      
        self.treeview_3.column("#0", width=0)
        self.treeview_3.heading("#0", text="")
 
        self.treeview_3.column("AnotherMovie", width=100, anchor="w")
        self.treeview_3.heading("AnotherMovie", text="AnotherMovie", anchor="center")      
        
        self.treeview_3.column("CharacterName", width=100, anchor="w")
        self.treeview_3.heading("CharacterName", text="CharacterName", anchor="center")
        
        self.treeview_3.column("MovieYear", width=75, anchor="w")
        self.treeview_3.heading("MovieYear", text="MovieYear", anchor="center")
        
        self.treeview_3.column("Genre", width=75, anchor="w")
        self.treeview_3.heading("Genre", text="Genre", anchor="center")
        

        def callback_2(selection):
            
            self.treeview_3_delete()
            
            check, filmo =self.db.filmography(selection)
            for i in range (check):
                self.treeview_3.insert('', 'end', text=i, values=tuple(filmo[i].values()), iid=str(i))
            print(filmo) 


        def callback_3(selection):
            
            self.delete()
            
            if selection == 'All':
                num, self.data = self.db.not_yet_seen_movie2(self.ID_str)
                for i in range(num):
                    self.treeview.insert('', 'end', text = " ", values=tuple(self.data[i].values()), iid=str(i))
                
                
                self.total = self.db.seen_count(self.ID_str)
                Status = ttk.Label(self.Log_frame, text = "You've watched {} movies".format(self.total['counts']), style ="BW.TLabel")
                Status.grid(row = 5, column = 2, sticky = tk.W + tk.E, pady = 3)
                
                self.left = self.db.unseen_count(self.ID_str)
                Status2 = ttk.Label(self.Log_frame, text = "Need to watch {} more".format(self.left['counts']), style ="BW.TLabel")
                Status2.grid(row = 6, column = 2, sticky = tk.W + tk.E, pady = 3)  

            
            elif selection != 'All':
                num, self.data = self.db.not_yet_seen_movie3(self.ID_str, selection)
                for i in range(num):
                    self.treeview.insert('', 'end', text = " ", values=tuple(self.data[i].values()), iid=str(i))
        
        
                self.total = self.db.seen_count(self.ID_str)
                Status = ttk.Label(self.Log_frame, text = "You've watched {} movies".format(self.total['counts']), style ="BW.TLabel")
                Status.grid(row = 5, column = 2, sticky = tk.W + tk.E, pady = 3)
        
                self.left = self.db.unseen_count(self.ID_str)
                Status2 = ttk.Label(self.Log_frame, text = "Need to watch {} more".format(self.left['counts']), style ="BW.TLabel")
                Status2.grid(row = 6, column = 2, sticky = tk.W + tk.E, pady = 3)  

                


        ## Filmography DropDown
        self.OPTIONS_2 = ["Benedict_Cumberbatch","Brie_Larson", "Chadwick_Boseman", "Chris_Evans", "Chris_Hemsworth", "Chris_Pratt", "Edward_Norton", "Mark_Ruffalo", "Paul_Bettany", "Paul_Rudd", "Robert_Downey_Jr", "Scarlett_Johansson", "Sebastian_Stan", "Tom_Hiddleston", "Tom_Holland"]
        self.variable_2 = tkinter.StringVar(self.window)
        self.variable_2.set(self.OPTIONS_2[0]) # default value
        self.w_2 = tkinter.OptionMenu(self.window, self.variable_2, *self.OPTIONS_2, command=callback_2)
        self.w_2.config(font=("나눔스퀘어", 7), bg = "black", fg = "white")
        self.w_2.place(x = 960, y = 552)
        
        ## Hero Select DropDown  
        self.OPTIONS_3 = ['All','Doctor_Strange','Captain_Marvel','Black_Panther','Captain_America','Thor','Starload', 'Hulk', 'Vision', 'Ant_Man', 'Iron_Man', 'Black_Widow', 'Winter_Soldier', 'Loki', 'Spider_Man']
        self.variable_3 = tkinter.StringVar(self.window)
        self.variable_3.set(self.OPTIONS_3[0])
        self.w_3 = tkinter.OptionMenu(self.window, self.variable_3, *self.OPTIONS_3, command = callback_3)
        self.w_3.config(font=("나눔스퀘어", 7), bg = "black", fg = "black", height = 1, width = 1)
        self.w_3.place(x = 535, y = 495)
        
'''       
        # - - - - - - - - - - - - - - - - - - - - -
        # Menus
        menubar = tk.Menu(self.window)

        filemenu = tk.Menu(menubar, tearoff=0)
        filemenu.add_command(label="Open", command=filedialog.askopenfilename)
        filemenu.add_command(label="Save", command=filedialog.asksaveasfilename)
        filemenu.add_separator()
        filemenu.add_command(label="Exit", command=self.window.quit)
        menubar.add_cascade(label="File", menu=filemenu)

        self.window.config(menu=menubar)

        # - - - - - - - - - - - - - - - - - - - - -
        # Quit button in the lower right corner
'''
# Create the entire GUI program
db = dbMarvel.Database()
program = Counter_program(db)

# Start the GUI event loop
program.window.mainloop()
