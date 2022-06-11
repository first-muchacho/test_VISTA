'''
Из-за чего возникла данная ошибка?
Revision: 41652
(python: 2.7.12 (v2.7.12:d33e0cf91556, Jun 27 2016, 15:19:22) [MSC v.1500 32 bit (Intel)])
(Qt: 4.8.7)
01.09.2020 9:22:05: <type 'exceptions.NameError'>
(global name 'isTypeOMS' is not defined)
  File "src\Registry\RegistryWindow.py", line 2551, in requestNewEvent
  File "src\Events\CreateEvent.py", line 228, in requestNewEvent
  File "src\library\Utils.py", line 2087, in wrapper
  File "src\Events\CreateEvent.py", line 725, in createEvent
  File "src\Forms\F025\F025Dialog.py", line 540, in prepare

'''


'''
Скорее всего данная ошибка связана с неправильным импортом модуля.
P.S.
Возможно переменная(isTypeOMS) не инициализирована в глобальной зоне видимости. 
'''
