<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'zmoumni' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'v ^59tDAm!5o#ry|KO^@I/N7Y<*ExPPtdmO?r&1MhLv&8~|]DF,AlM~S`$EJyY_p' );
define( 'SECURE_AUTH_KEY',   'c}.yDW+mhIle<5)_u=/Ab 9@jh`%]L$TJ,4P0!F4[N2#7Q4W)(t{fYW&Il1Z(I>*' );
define( 'LOGGED_IN_KEY',     'Qt/1pB~MF4%z5/}S|Y4yFIY/.L9MW?dL-_f464XSDrVH+-A4h@jG~B8A+Z7YlWK>' );
define( 'NONCE_KEY',         '3HG!uxw=].p}Xl.hT>>p:FU:a&|aQCPJqUkZfE*.w+3V:{bW}!TSJ)XEXB=/SI{_' );
define( 'AUTH_SALT',         'IlJ?grxFpzSKqUY=2}J!*!~md^2jauFvrmXbEFwH:}Lnp=x$BKKEg.A16{g#9N% ' );
define( 'SECURE_AUTH_SALT',  'J pVb.rZ9(FP*F2a[QD;Cuam[L;@J=17|`:!Y81t@iPM.Rc[*fyV`H73C=}`W{0)' );
define( 'LOGGED_IN_SALT',    '.u }#YQDD2,s8zQ{X1R._>bJKt(ks;Iv+R|[7>7Zs<ADZohD!@Axy{C :VJ^D5qM' );
define( 'NONCE_SALT',        'pO<(Y}*tO-r&}IPV>h/6[.MjvZ]DJe`02>*!#2f:>ke`?Pcu%%Qxuv>:Y3[CE7l>' );
define( 'WP_CACHE_KEY_SALT', '8=`4:CBe,,_EhE#N?.SAs;!xJoPjP{qL8IdFwXOuxxC&aG:mla8+ob<4DK2i@7(M' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
