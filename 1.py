import time
import schedule
import oracledb
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

ORACLE_USER = "book_store"
ORACLE_PW   = "root"
ORACLE_DSN  = "192.168.0.105:1521/XE"  # Thin DSN

class BestSeller:
    def __init__(self, rank, src, title, link):
        self.rank, self.src, self.title, self.link = rank, src, title, link

def setup_driver():
    opts = webdriver.ChromeOptions()
    # 헤드리스(창 숨김)
    opts.add_argument("--headless=new")
    opts.add_argument("--disable-gpu")
    opts.add_argument("--no-sandbox")
    opts.add_argument("--disable-dev-shm-usage")
    opts.add_argument("--window-size=1920,1080")
    return webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=opts)

def scrape():
    driver = setup_driver()
    driver.implicitly_wait(10)
    wait = WebDriverWait(driver, 7)
    driver.get("https://store.kyobobook.co.kr/bestseller/online/daily")

    rows, ranking = [], 1
    try:
        while ranking <= 100:
            wait.until(EC.presence_of_all_elements_located(
                (By.CSS_SELECTOR, "main > section > div > div > section > ol > li")
            ))
            time.sleep(0.4)
            items = driver.find_elements(By.CSS_SELECTOR, "main > section > div > div > section > ol > li")
            for li in items:
                try:
                    a = li.find_element(By.CSS_SELECTOR, "div > div > div > a")
                    img = a.find_element(By.CSS_SELECTOR, "div > img")
                except:
                    continue
                src   = img.get_attribute("src") or ""
                title = img.get_attribute("alt") or ""
                link  = a.get_attribute("href") or ""
                rows.append(BestSeller(ranking, src, title, link))
                ranking += 1
                if ranking > 100: break
            if ranking > 100: break
            try:
                nxt = driver.find_element(
                    By.CSS_SELECTOR, "body > div > main > section > div > div > section > div:last-child > div > a:last-child"
                )
                driver.execute_script("arguments[0].scrollIntoView({block:'center'});", nxt)
                time.sleep(0.2); nxt.click()
            except:
                break
    finally:
        driver.quit()
    return rows

def upsert_db(data):
    if not data: return
    conn = oracledb.connect(user=ORACLE_USER, password=ORACLE_PW, dsn=ORACLE_DSN)
    try:
        cur = conn.cursor()
        merge_sql = """
            MERGE INTO bestseller_simple t
            USING (SELECT :1 rank_num, :2 title, :3 image_src, :4 link_url FROM dual) s
              ON (t.link_url = s.link_url)
            WHEN MATCHED THEN
              UPDATE SET t.rank_num = s.rank_num,
                         t.title    = s.title,
                         t.image_src= s.image_src
            WHEN NOT MATCHED THEN
              INSERT (rank_num, title, image_src, link_url)
              VALUES (s.rank_num, s.title, s.image_src, s.link_url)
        """
        cur.executemany(merge_sql, [(r.rank, r.title, r.src, r.link) for r in data])
        conn.commit()
        print(f"Upserted {len(data)} rows")
    finally:
        cur.close(); conn.close()

def job():
    data = scrape()
    upsert_db(data)

if __name__ == "__main__":
    # 즉시 1회 실행
    job()
    # 이후 매일 03:00 실행
    schedule.every().day.at("03:00").do(job)
    print("Scheduled daily at 03:00. Running...")
    while True:
        schedule.run_pending()
        time.sleep(1)