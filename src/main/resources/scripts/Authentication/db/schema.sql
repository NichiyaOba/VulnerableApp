DROP TABLE IF EXISTS auth_users;

CREATE TABLE auth_users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(500),
    salt VARCHAR(100),
    algorithm ENUM('PLAIN', 'MD5', 'SHA1', 'SHA256', 'BCRYPT'),
    level INT,
    email VARCHAR(100),
    role VARCHAR(20)
);

-- Application user has full access (for functional purposes)
GRANT ALL ON auth_users TO application;

-- No shared exploration account is created here. A07:2025 ("Do not ship or deploy with any
-- default credentials", CWE-798 / CWE-1392) rules out shipping a fixed readonly_user /
-- readonly_password pair, and granting it SELECT on auth_users handed every visitor a copy of
-- the credential store. The hashing levels expose their stored hash through the API response,
-- so the module stays explorable without a standing database account.
