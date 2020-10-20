<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define( 'DB_NAME', 'db_wordpress' );

/** Имя пользователя MySQL */
define( 'DB_USER', 'pdemocri' );

/** Пароль к базе данных MySQL */
define( 'DB_PASSWORD', 'pdemocri' );

/** Имя сервера MySQL */
define( 'DB_HOST', 'serv-mysql:3306' );

/** Кодировка базы данных для создания таблиц. */
define( 'DB_CHARSET', 'utf8mb4' );

/** Схема сопоставления. Не меняйте, если не уверены. */
define( 'DB_COLLATE', '' );

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'T?9|-7+t7#Y.;IBNMh5GD@vBR]|m.^(0x>I[8Dl~RArAzK#C2ME7@$@CowHb:gXw' );
define( 'SECURE_AUTH_KEY',  'gf}RbC2`uI[c,,;MQj>:UF1MIq9@[3=iONI)C0=VKm_]KfO]GRNHH*r5teXyeq&c' );
define( 'LOGGED_IN_KEY',    '1_]cH8JHR^HciL@f`D-OYvtJbh:2124deq{O)e[CIt5@MX%`@Ce(e6.YYI`{vp),' );
define( 'NONCE_KEY',        'n8j.HHU%dMQrtw1a2CO9EZ;5 o]Af Rk<k:n:gR.Mn#r|x#??y/!DE%yY51HGYbc' );
define( 'AUTH_SALT',        'L( kDo(Tq)m}&!S+mo6qiQANHt]*lYD1?nH)kyEZL^^1ing|DDzHtL[%7Sn&XhqX' );
define( 'SECURE_AUTH_SALT', '~A@fNXXU;u?Y396}4n5GU`y8h/2t9sF&N+)b3IJTgFcf=fRPYo}Z E#`S*$5~t1%' );
define( 'LOGGED_IN_SALT',   '%U |ms3)/bQ.zLaUKd9yL?Y0RbI$5I^2M+SZ3,;zp?y@Fk:HueL.;QLGu?*h[LBc' );
define( 'NONCE_SALT',       'sD_^gHOP[kGxWzZEj`(ngN%T+L+.qhsmRH8@AAG1B`ccv/>XaVVs=pGO>Kq8yjt6' );

/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 *
 * Информацию о других отладочных константах можно найти в Кодексе.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Инициализирует переменные WordPress и подключает файлы. */
require_once( ABSPATH . 'wp-settings.php' );