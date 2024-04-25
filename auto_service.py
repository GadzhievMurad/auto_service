from doctest import master
import tkinter as tk
from tkinter import Canvas, Label, StringVar, Tk, Entry, messagebox
from tkinter import ttk
from tkinter.ttk import Combobox
from datetime import datetime
import sqlite3


list = []


file = open ('db.db.sql', 'r', encoding = 'utf-8')
build_db = file.read()
file.close

connector = sqlite3.connect ('db.db')
cursor = connector.cursor()
cursor = executescript (build_db)
sql_services = cursor.execute ('SELECT * FROM services')

#adding any new service in list
for row in sql_services:
    list.append(row[1])

#writing changes in db
connector.commit()
cursor.close()
connector.close()


class MainLabel(Label):
    def __init__(self, master, text, font, style, x, y, fg='#E9D6B8', bg='#212B33'):
        super().__init__(master, text=text, font=(font, 30, style), fg=fg, bg=bg)
        self.place(x=x, y=y)


class text(Label):
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


class ButtonField(tk.Button):
    def __init__(self, master, text, font, x, y, width, window):
        super().__init__(master, text=text, font=(font), width=width, command=self.click)
        self.place(x=x, y=y)
        self.window = window

    def click(self):
        if all(hasattr(self.window, f"{field}_entry") for field in ['marka', 'model', 'color', 'year_build', 'num']):

            if any(not getattr(self.window, f"{field}_entry").get() for field in ['marka', 'model', 'color', 'year_build', 'num']):
                messagebox.showerror('Ошибка', 'Пожалуйста, заполните все поля.')
            else:
                self.print_file()
                messagebox.showinfo('Внимание', 'Данные успешно добавлены')
        else:
            messagebox.showerror('Ошибка', 'Не удалось получить данные из полей ввода.')

    def print_file(self):
        current_datetime = datetime.now()
        file_path = 'report.txt'
        global service, price

        try:
            with open(file_path, 'a', encoding='utf8') as file:
                file.write('=============' + '\n')

                file.write(str(current_datetime)[:-7] + '\n')
                file.write(' ' + '\n')

                file.write('Модель:' + self.window.model_entry.get() + '\n')
                file.write('Марка:' + self.window.marka_entry.get() + '\n')
                file.write('Цвет:' + self.window.color_entry.get() + '\n')
                file.write('Год производства:' + self.window.year_build_entry.get() + '\n')
                file.write('Гос номер:' + self.window.num_entry.get() + '\n')
                file.write(' ' + '\n')

                file.write('Услуга: ' + service + '\n')
                file.write('Стоимость: ' + str(price) + '\n')

                file.write('=============' + '\n')

                file.write(' ' + '\n')
                file.write(' ' + '\n')

        except Exception as e:

            messagebox.showerror('Ошибка', f'Ошибка при записи в файл: {e}')






class Combobox(ttk.Combobox):
    def __init__(self, master, x, y, width, values, font, window):
        super().__init__(master, values=values, font=font, state='readonly')
        self.place(x=x, y=y, width=width)
        self.window = window

        self.bind('<<ComboboxSelected>>', lambda event: self.select())

    def select(self):
        global price, service
        if self.get() == self['values'][0]:
            self.price = 1000
        elif self.get() == self['values'][1]:
            self.price = 2000
        elif self.get() == self['values'][2]:
            self.price = 1500
        elif self.get() == self['values'][3]:
            self.price = 3000
        elif self.get() == self['values'][4]:
            self.price = 5000
        elif self.get() == self['values'][5]:
            self.price = 3500
        elif self.get() == self['values'][6]:
            self.price = 1000
        else:
            self.price = 0

        price = self.price
        service = self.get()

        self.window.price_label.config(text='Цена: ' + str(price) + 'руб.')


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

        label_model = text (self, 'Модель автомобиля', 'Montserrat', 40, 150)

        label_marka = text(self, 'Марка автомобиля:', 'Montserrat', 40, 200)

        label_color = text(self, 'Цвет автомобиля:', 'Montserrat', 40, 250)

        label_year_build = text(self, 'Год производства автомобиля:', 'Montserrat', 40, 300)

        label_num = text(self, 'Номера автомобиля:', 'Montserrat', 40, 350)

        combobox_label = text(self, 'Выберите услугу из списка:', 'Montserrat', 40, 400)

        self.price_label = text(self, '', 'Montserrat', 350, 440)

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


    def __button(self):
        button1 = ButtonField(self, 'записать', 'Montserrat', 550, 550, 10, self)

    def __combobox(self):
        list_values = [
            'замена детали', 'технический осмотр',
            'покраска', 'ремонт детали', 'замена детали',
            'замена шин', 'мойка']

        self.service_combobox = Combobox(self, 350, 400, 200, list_values, 'Montserrat 15', self)


def __new_combobox (self):
    global list
    self.service_combobox = my_combobox (list, 'Arial 15', 450, 200, 200)


if __name__ == "__main__":
    gui = GUI()
