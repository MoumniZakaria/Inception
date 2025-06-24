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
define( 'AUTH_KEY',          '(I@M4Q!BRXgX/Bcq#Q?w#ppGra)s$d:yLd{ZqCoei~2;~Bvo@)la2%y/eT,aC/nj' );
define( 'SECURE_AUTH_KEY',   'Iz<l47( M#?MXuyPxjzxbwM!Ew?A^8>U#^?U}IB&>Z1LPUd8c+Y`n[;Ui_?I0>|>' );
define( 'LOGGED_IN_KEY',     '7op6y]:hX6JA7*z7jgOtTm<_Y8~4/WEB;Bq_N|k}1^#Z<]m_&l3B3#ie8Xe^*;0j' );
define( 'NONCE_KEY',         'PYd%JWo!6h4Af Y}6XNeGTX!d.xYDV){X?.B[`LbxF%Uf3B0x3?k&_)*>)JE]Uz*' );
define( 'AUTH_SALT',         '6a|*_ec~yJ+10JqKz>mYuA@C m/vci+P+@N.%Vd`|sDjj=/k/iXVWfS;%To+Mek.' );
define( 'SECURE_AUTH_SALT',  'C=D s6%hdWkaEAbHukp^~u``:w]PAIvbxqY?YYOcNk.QG_W bKc+IlVi?-1sOfdQ' );
define( 'LOGGED_IN_SALT',    '?b}/6Zs2%PajQPDbZBRo sf3<({-n-&u_xX4+OB{pbRqc.{vB<(3}S94yn+R?V.$' );
define( 'NONCE_SALT',        'fYA?j)P&OZ<X9Yx+isvL0e}X%BFKD1l(KnWOZ<m?;MAs?>])GP!_3W?6hkXX:7,B' );
define( 'WP_CACHE_KEY_SALT', ']tnwI{4iq;ka7DSXCSPATL(szL1=CUJVReC`.#(v$;;PsxCx7#<13?:|D/=-U*VI' );


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
