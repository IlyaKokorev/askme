# Askmy (Хорошие вопросы)

Приложение, в котором пользователи могут задавать вопросы и отвечать на них. 

Приложение на [Heroku](https://ilyaaskme.herokuapp.com/)

# Установка и запуск

* ```git clone git@github.com:IlyaKokorev/askme.git```
* ```bundle install```
* ```bundle exec rake db:migrate```
* ```yarn```
* ```bundle exec rails s```
* ```http://localhost:3000/```

Для использования `reCAPTCHA` необходимо переименовать файл .env.example в .env

```cp .env.example .env```

И прописать в вайле `.env` свои переменные RECAPTCHA_ASKME_PUBLIC_KEY и RECAPTCHA_ASKME_PRIVATE_KEY