from locust import HttpUser, task, between


class CatalogueBrowse(HttpUser):
    wait_time = between(2, 6)

    @task(5)
    def home(self):
        self.client.get("/v1/catalogue/home")

    @task(3)
    def trending(self):
        self.client.get("/v1/catalogue/trending")

    @task(2)
    def title_detail(self):
        self.client.get("/v1/catalogue/title/abc-123")
