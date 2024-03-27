Репа містить код функціонального Telegram-бота з кореневою командою та налаштуваннями.
Робоча назва new-poject.
Бот має можливість обробляти повідомлення від користувачів та відповідати на них. Використована мова Golang, фреймворки github.com/spf13/cobra та gopkg.in/telebot.v3, наявні обробники повідомлень для бота, які відповідають на повідомлення в Telegram.

Пошагові етапи проекту:
Встановити Golang та налаштувати середовище розробки
Створити новий проєкт на GitHub та налаштувати Git.
Додати залежність на бібліотеку github.com/spf13/cobra за домопогою import (практичне завдання продемонстровано в лекції 2.4)
Створити Telegram-бота за допомогою BotFather.
Отримати токен бота та зберегти його у змінну середовища TELE_TOKEN.
Імпортувати необхідні бібліотеки.
Встановити бібліотеку gopkg.in/telebot.v3 за допомогою go get.
Отримати токен бота зі змінної середовища.
Створити об'єкт бота за допомогою telebot.NewBot().
Додати обробник повідомлень за допомогою kbot.Handle(telebot.OnText, func(m telebot.Context)
Описати функцію-обробник, яка буде відповідати на повідомлення.

Декларація імпорту:
import (
	"fmt"

	"github.com/spf13/cobra"
	telebot "gopkg.in/telebot.v3"
)

Форматування та виправлення коду: $ gofmt -s -w ./

Збірка версії коду: $ go build -ldflags "-X="github.com/vit-um/kbot/cmd.appVersion=v1.0.x
Alias боту = Start

Код зворотнього звязку: 
		kbot.Handle(telebot.OnText, func(m telebot.Context) error {
			log.Print(m.Message().Payload, m.Text())
			payload := m.Message().Payload

			switch payload {
			case "hello":
				err = m.Send(fmt.Sprintf("Hello I'm Kbot %s!", appVersion))
			}
			
			return err
		})

Призначення змінних середовища безпечно:
$ read -s TELE_TOKEN
(# Ctr+V and Enter)
$ echo $TELE_TOKEN
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
$ export TELE_TOKEN
