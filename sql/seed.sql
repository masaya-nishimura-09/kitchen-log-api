-- =====================
-- 開発用モックデータ
-- パスワードはすべて "Password1" (BCryptハッシュ済み)
-- =====================
-- users
INSERT INTO
    users (
        id,
        username,
        email,
        password,
        created_at,
        updated_at
    )
VALUES
    (
        1,
        'テストユーザー',
        'test@example.com',
        '{bcrypt}$2b$10$u9X60onSaZLwlhp1wAhnzeWPW2bP3qaS0iLjjcP2USk8ZCOLwacuy',
        NOW (),
        NOW ()
    ),
    (
        2,
        'サブユーザー',
        'sub@example.com',
        '{bcrypt}$2b$10$u9X60onSaZLwlhp1wAhnzeWPW2bP3qaS0iLjjcP2USk8ZCOLwacuy',
        NOW (),
        NOW ()
    );

-- recipes
INSERT INTO
    recipes (
        id,
        user_id,
        title,
        image_url,
        description,
        created_at,
        updated_at
    )
VALUES
    (1, 1, '親子丼', NULL, '定番の親子丼レシピ', NOW (), NOW ()),
    (
        2,
        1,
        'トマトパスタ',
        NULL,
        '簡単トマトソースパスタ',
        NOW (),
        NOW ()
    ),
    (3, 1, '味噌汁', NULL, NULL, NOW (), NOW ()),
    (4, 2, 'アボカドサラダ', NULL, 'ヘルシーなサラダ', NOW (), NOW ());

-- ingredients
INSERT INTO
    ingredients (
        recipe_id,
        user_id,
        name,
        amount,
        measurement_unit,
        order_index,
        created_at,
        updated_at
    )
VALUES
    -- 親子丼
    (1, 1, '鶏もも肉', 200.00, 'G', 1, NOW (), NOW ()),
    (1, 1, '卵', 3.00, 'PIECE', 2, NOW (), NOW ()),
    (1, 1, '玉ねぎ', 1.00, 'PIECE', 3, NOW (), NOW ()),
    (1, 1, 'だし汁', 200.00, 'ML', 4, NOW (), NOW ()),
    (1, 1, '醤油', 30.00, 'ML', 5, NOW (), NOW ()),
    -- トマトパスタ
    (2, 1, 'パスタ', 100.00, 'G', 1, NOW (), NOW ()),
    (2, 1, 'トマト缶', 400.00, 'G', 2, NOW (), NOW ()),
    (2, 1, 'ニンニク', 2.00, 'CLOVE', 3, NOW (), NOW ()),
    (2, 1, 'オリーブオイル', 15.00, 'ML', 4, NOW (), NOW ()),
    -- 味噌汁
    (3, 1, '豆腐', 150.00, 'G', 1, NOW (), NOW ()),
    (3, 1, 'わかめ', 5.00, 'G', 2, NOW (), NOW ()),
    (3, 1, '味噌', 30.00, 'G', 3, NOW (), NOW ()),
    (3, 1, 'だし汁', 400.00, 'ML', 4, NOW (), NOW ()),
    -- アボカドサラダ
    (4, 2, 'アボカド', 1.00, 'PIECE', 1, NOW (), NOW ()),
    (4, 2, 'レタス', 50.00, 'G', 2, NOW (), NOW ()),
    (4, 2, 'レモン汁', 15.00, 'ML', 3, NOW (), NOW ());

-- steps
INSERT INTO
    steps (
        recipe_id,
        user_id,
        text,
        order_index,
        created_at,
        updated_at
    )
VALUES
    -- 親子丼
    (1, 1, '鶏もも肉を一口大に切る', 1, NOW (), NOW ()),
    (1, 1, '玉ねぎを薄切りにする', 2, NOW (), NOW ()),
    (1, 1, 'だし汁・醤油を煮立て鶏肉と玉ねぎを煮る', 3, NOW (), NOW ()),
    (1, 1, '溶き卵を回しかけて半熟に仕上げる', 4, NOW (), NOW ()),
    -- トマトパスタ
    (2, 1, 'パスタを茹でる', 1, NOW (), NOW ()),
    (2, 1, 'ニンニクをオリーブオイルで炒める', 2, NOW (), NOW ()),
    (2, 1, 'トマト缶を加えて煮詰める', 3, NOW (), NOW ()),
    (2, 1, 'パスタとソースを和える', 4, NOW (), NOW ()),
    -- 味噌汁
    (3, 1, 'だし汁を温める', 1, NOW (), NOW ()),
    (3, 1, '豆腐を角切りにして加える', 2, NOW (), NOW ()),
    (3, 1, '味噌を溶き入れる', 3, NOW (), NOW ()),
    (3, 1, 'わかめを加えて完成', 4, NOW (), NOW ());

-- tags
INSERT INTO
    tags (recipe_id, user_id, name, created_at, updated_at)
VALUES
    (1, 1, '和食', NOW (), NOW ()),
    (1, 1, '丼もの', NOW (), NOW ()),
    (2, 1, '洋食', NOW (), NOW ()),
    (2, 1, 'パスタ', NOW (), NOW ()),
    (3, 1, '和食', NOW (), NOW ()),
    (3, 1, '汁物', NOW (), NOW ()),
    (4, 2, 'サラダ', NOW (), NOW ()),
    (4, 2, 'ヘルシー', NOW (), NOW ());

-- set_meals
INSERT INTO
    set_meals (
        id,
        user_id,
        title,
        description,
        created_at,
        updated_at
    )
VALUES
    (1, 1, '和食定食', '親子丼と味噌汁のセット', NOW (), NOW ());

-- set_meal_recipes
INSERT INTO
    set_meal_recipes (
        set_meal_id,
        recipe_id,
        user_id,
        created_at,
        updated_at
    )
VALUES
    (1, 1, 1, NOW (), NOW ()),
    (1, 3, 1, NOW (), NOW ());

-- calendar
INSERT INTO
    calendar (
        user_id,
        recipe_id,
        start,
        color,
        created_at,
        updated_at
    )
VALUES
    (1, 1, CURRENT_DATE, 'BLUE', NOW (), NOW ()),
    (1, 2, CURRENT_DATE + 1, 'RED', NOW (), NOW ()),
    (1, 3, CURRENT_DATE + 2, 'GREEN', NOW (), NOW ());

-- shopping_list
INSERT INTO
    shopping_list (
        user_id,
        name,
        amount,
        measurement_unit,
        status,
        created_at,
        updated_at
    )
VALUES
    (1, '鶏もも肉', 300.00, 'G', FALSE, NOW (), NOW ()),
    (1, '卵', 6.00, 'PIECE', FALSE, NOW (), NOW ()),
    (1, 'トマト缶', 800.00, 'G', TRUE, NOW (), NOW ()),
    (1, '味噌', 200.00, 'G', FALSE, NOW (), NOW ());

-- シーケンスをリセット（手動でidを指定したため）
SELECT
    SETVAL (
        'users_id_seq',
        (
            SELECT
                MAX(id)
            FROM
                users
        )
    );

SELECT
    SETVAL (
        'recipes_id_seq',
        (
            SELECT
                MAX(id)
            FROM
                recipes
        )
    );

SELECT
    SETVAL (
        'set_meals_id_seq',
        (
            SELECT
                MAX(id)
            FROM
                set_meals
        )
    );
