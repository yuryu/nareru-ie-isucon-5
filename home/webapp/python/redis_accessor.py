import redis

p_step_user="step_user_{user_id}"
p_friend_counter="friend_counter_{}"

conn = redis.StrictRedis(host='localhost', port=6379)
def get_user_step(conn, user_id):
    return conn.get(p_step_user.format(user_id=user_id))

def set_user_step(conn, user_id, step_user):
    cnt = conn.llen(p_step_user.format(user_id=user_id))
    if cnt == 10:
        conn.lpop(p_step_user.format(user_id=user_id))
    conn.rpush(p_step_user.format(user_id=user_id), step_user)

