from tkinter import *
from tkinter import messagebox, Button
from tkinter.ttk import Combobox
from datetime import datetime
import sqlite3

list = []

file = open('auto.db.sql', 'r', encoding='utf-8')
db = file.read()
file.close()

conn = sqlite3.connect('auto.db')
cursor = conn.cursor()

cursor.executescript(db)
sql_services = cursor.execute("Select * from services")

for row in sql_services:
    list.append(row[1])

conn.commit()
cursor.close()
conn.close()


class MainLabel(Label):
    def __init__(self, master, text, font, style, x, y, fg='#E9D6B8', bg='#212B33'):
        super().__init__(master, text=text, font=(font, 30, style), fg=fg, bg=bg)
        self.place(x=x, y=y)


class TextLabel(Label):
    def __init__(self, master, text, font, x, y, fg='White', bg='#212B33'):
        super().__init__(master, text=text, font=(font, 18), fg=fg, bg=bg)
        self.place(x=x, y=y)


class EntryField(Entry):
    def __init__(self, master, font_name, x, y, width, font_size=15):
        super().__init__(master, font=(font_name, font_size), width=width, textvariable=StringVar())
        self.place(x=x, y=y)
        self.name = None

    def set_name(self, name):
        self.name = name


class ButtonField (Button):
    def __init__(self, master, text, font, x, y, width, window):
        super().__init__(master, text=text, font=font, width=width, command=self.click)
        self.place(x=x, y=y)
        self.window = window

    def click(self):
        if all(hasattr(self.window, f"{field}_entry") for field in
               ['marka', 'model', 'color', 'year_build', 'num', 'name', 'surname', 'usernum']):
            if any(not getattr(self.window, f"{field}_entry").get() for field in
                   ['marka', 'model', 'color', 'year_build', 'num', 'name', 'usernum']):
                messagebox.showerror('Ошибка', 'Пожалуйста, заполните все поля.')
            else:
                selected_service = self.window.service_combobox.get()  # Get the selected service from combobox
                self.print_file(selected_service)  # Pass the selected service to print_file
                messagebox.showinfo('Внимание', 'Данные успешно добавлены')
        else:
            messagebox.showerror('Ошибка', 'Не удалось получить данные из полей ввода.')

    def print_file(self, selected_service):
        current_datetime = datetime.now()
        file_path = 'report.txt'
        global price

        try:
            with open(file_path, 'a', encoding='utf8') as file:
                file.write('=============\n')
                file.write(str(current_datetime)[:-7] + '\n')
                file.write(' \n')
                file.write('Модель:' + self.window.model_entry.get() + '\n')
                file.write('Марка:' + self.window.marka_entry.get() + '\n')
                file.write('Цвет:' + self.window.color_entry.get() + '\n')
                file.write('Год производства:' + self.window.year_build_entry.get() + '\n')
                file.write('Гос номер:' + self.window.num_entry.get() + '\n')
                file.write(' \n')
                file.write('Услуга: ' + selected_service + '\n')
                file.write('Стоимость: ' + str(price) + 'руб.\n')
                file.write('=============\n')
                file.write(' \n')
                file.write(' \n')

        except Exception as e:
            messagebox.showerror('Ошибка', f'Ошибка при записи в файл: {e}')


class ServiceCombobox(Combobox):
    def __init__(self, master, options, x, y, width, state):
        super().__init__(master, values=options, width=width, state=state)
        self.place(x=x, y=y)
        self.options = options
        self.bind('<<ComboboxSelected>>', lambda event: self.select())

    def select(self):
        global price

        selected_service = self.options[self.current()]
        conn = sqlite3.connect('auto.db')
        cursor = conn.cursor()
        sql_services = cursor.execute(f"SELECT * FROM services WHERE name = '{selected_service}'")

        for row in sql_services:
            price = row[2]

        conn.commit()
        cursor.close()
        conn.close()

        if hasattr(self, 'price_label'):
            self.price_label.destroy()

        self.price_label = Label(text='Цена: ' + str(price) + 'руб.', font=('Montserrat', 18), fg='White', bg='#212B33')
        self.price_label.place(x=350, y=440)


class GUI(Tk):
    def __init__(self):
        super().__init__()
        self.geometry('1200x600')
        self.title('window')
        self.configure(bg='#212B33')
        self.resizable(width=False, height=False)
        self.__canvas()
        self.__label()
        self.__entry()
        self.__button()
        self.__combobox()
        self.mainloop()

    def __canvas(self):
        self.canva = Canvas(width=1200, height=600, bg="#212B33")
        self.canva.place(relx=0.5, rely=0.5, anchor='center')

    def __label(self):
        label_title = MainLabel(self, 'AUTOSERVICE', 'Montserrat', 'bold', 483, 50)

        label_model = TextLabel(self, 'Модель автомобиля', 'Montserrat', 40, 150)
        label_marka = TextLabel(self, 'Марка автомобиля:', 'Montserrat', 40, 200)
        label_color = TextLabel(self, 'Цвет автомобиля:', 'Montserrat', 40, 250)
        label_year_build = TextLabel(self, 'Год производства автомобиля:', 'Montserrat', 40, 300)
        label_num = TextLabel(self, 'Номера автомобиля:', 'Montserrat', 40, 350)
        combobox_label = TextLabel(self, 'Выберите услугу из списка:', 'Montserrat', 40, 400)
        name = TextLabel(self, 'Имя:', 'Montserrat', 750, 150)
        surname = TextLabel(self, 'Фамилия:', 'Montserrat', 750, 200)
        autonum = TextLabel(self, 'Номер телефона:', 'Montserrat', 750, 250)
        self.price_label = TextLabel(self, '', 'Montserrat', 350, 440)

    def __entry(self):
        self.marka_entry = EntryField(self, 'Arial', 350, 152, 15)
        self.marka_entry.set_name('marka')

        self.model_entry = EntryField(self, 'Arial', 350, 202, 15)
        self.model_entry.set_name('model')

        self.color_entry = EntryField(self, 'Arial', 350, 252, 15)
        self.color_entry.set_name('color')

        self.year_build_entry = EntryField(self, 'Arial', 350, 302, 15)
        self.year_build_entry.set_name('year_build')

        self.num_entry = EntryField(self, 'Arial', 350, 352, 15)
        self.num_entry.set_name('num')

        self.name_entry = EntryField(self, 'Arial', 940, 152, 15)
        self.name_entry.set_name('name')

        self.surname_entry = EntryField(self, 'Arial', 940, 202, 15)
        self.surname_entry.set_name('surname')

        self.usernum_entry = EntryField(self, 'Arial', 940, 252, 15)
        self.usernum_entry.set_name('usernum')

    def __button(self):
        button1 = ButtonField(self, 'записать', 'Montserrat', 550, 550, 10, self)

    def __combobox(self):
        global list
        self.service_combobox = ServiceCombobox(self, list, 350, 400, 15, 'readonly')


gui = GUI()
