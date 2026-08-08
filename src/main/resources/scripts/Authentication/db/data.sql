-- Level 1: Parameterised login lookup (prepared statement, no string concatenation)
-- Real password: 'T7q.Kx2v!Lm9Rz4B' (BCrypt, cost 12)
INSERT INTO auth_users VALUES (1, 'admin_sqli', '$2y$12$04HEUZuhFotVuJWEFEOZQeg72.A4u5dph8MSJWtjfQGzqSUQbnWhm', NULL, 'BCRYPT', 1, 'admin_sqli@example.com', 'ADMIN');

-- Level 2: Audit logging that never records the submitted secret
-- Real password: 'H4d.Nw8k!Pz3Qv6X' (BCrypt, cost 12)
INSERT INTO auth_users VALUES (2, 'admin_logs', '$2y$12$XGOAGtAOsnSaq4bNxJ6emeFMRfUqGV6S0D07G/I9L5tXHh1WyFw0u', NULL, 'BCRYPT', 2, 'admin_logs@example.com', 'ADMIN');

-- Level 3: Adaptive hashed storage; nothing password-related is returned to the client
-- Real password: 'Z2m.Rt9c!Vb5Kx8N' (BCrypt, cost 12)
INSERT INTO auth_users VALUES (3, 'admin_plain', '$2y$12$QEbFqYGLUS7OWjDbdLzKuOo0RK.5jl4tfh14ztZojM7SGdbcZxEjO', NULL, 'BCRYPT', 3, 'admin_plain@example.com', 'ADMIN');

-- Level 4: MD5 Hashing (f2C@9tYk*1hP)
INSERT INTO auth_users VALUES (4, 'admin_md5', '0168b6037606df265be7f1f5d9c0e7fe', NULL, 'MD5', 4, 'admin_md5@example.com', 'ADMIN');

-- Level 5: SHA1 Hashing (x5B&3gHq+7vS)
INSERT INTO auth_users VALUES (5, 'admin_sha1', '632e10860bd26278451d3f89d1c46f180e5623e0', NULL, 'SHA1', 5, 'admin_sha1@example.com', 'ADMIN');

-- Level 6: SHA-256 (No Salt) (m8D!4kLr#2jZ)
INSERT INTO auth_users VALUES (6, 'admin_sha256', '8b8eca84f7e2b04f531749f999c3bf9e3f045bab78f4c8a451fa70929b3c3946', NULL, 'SHA256', 6, 'admin_sha256@example.com', 'ADMIN');

-- Level 7: Identical generic failure message for every outcome + constant-time unknown-user path
-- Real password: 'J6p.Wq3n!Xr7Tz2M' (BCrypt, cost 12 — the salt column is unused, BCrypt embeds its own)
INSERT INTO auth_users VALUES (7, 'admin_enum', '$2y$12$996Y52ZudaLmfpANGcFhAuRyUAyxF8DbGXqoQunVP3scR4RcYeJiq', NULL, 'BCRYPT', 7, 'admin_enum@example.com', 'ADMIN');

-- Level 8: Strong 16-character random secret instead of the common password 'password123'
-- Real password: 'C9v.Lb4h!Ns6Wy1D' (BCrypt, cost 12)
INSERT INTO auth_users VALUES (8, 'admin_weak', '$2y$12$Z7WUV1iTflGStiF5m2XJMeFadmb7puYsCE5j/FtG06iOPq/1hOmTe', NULL, 'BCRYPT', 8, 'admin_weak@example.com', 'ADMIN');

-- Level 9: Secure (Bcrypt + Generic Error) (9fG#2hJk*LmN!8qR)
-- Bcrypt hash for '9fG#2hJk*LmN!8qR'
INSERT INTO auth_users VALUES (9, 'admin_secure', '$2a$10$1WiFUNqUY/vHTzR2QtuMQuzCLK3aZEdjEUpqS4msXOevaCz7Wobe.', NULL, 'BCRYPT', 9, 'admin_secure@example.com', 'ADMIN');

-- Level 10: BCrypt work factor raised from 4 to 12; no longer the common password 'sunshine'
-- Real password: 'F3k.Dm7r!Qt5Zx8P' (BCrypt, cost 12)
INSERT INTO auth_users VALUES (10, 'admin_lowcost', '$2y$12$7zgAtI98xlUM0ciDWQFxhuNZ2.bsDKEr/zVXezScskq3depZN5ymq', NULL, 'BCRYPT', 10, 'admin_lowcost@example.com', 'ADMIN');
