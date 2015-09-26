import redis

p_step_user="step_user_{user_id}" # list

conn = redis.StrictRedis(host='localhost', port=6379)
def get_user_step(conn, user_id):
    return conn.lrange(p_step_user.format(user_id=user_id), 0, 9) # []

def set_user_step(conn, user_id, step_user):
    cnt = conn.llen(p_step_user.format(user_id=user_id))
    if cnt == 10:
        conn.lpop(p_step_user.format(user_id=user_id))
    conn.rpush(p_step_user.format(user_id=user_id), step_user)


p_friend_counter="friend_counter_{user_id}" # string (int)

def get_user_frind_num(conn, user_id):
    cnt = conn.get(p_friend_counter.format(user_id=user_id))
    return int(cnt) if cnt else 0

def inc_user_frind_num(conn, user_id):
    conn.incr(p_friend_counter.format(user_id=user_id))