import requests
import json

USERNAME = 'svenskiy'


class GitHubUserAPI():
    """Класс для работы с API GitHub"""
    URL = "https://api.github.com"

    def __init__(self, username, **kwargs):
        self.username = username
        self.last_response = ''

    def _get_request(self, req):
        buffer = requests.get(req)
        self.last_response = json.loads(buffer.text)

    def get_user_info(self):
        request = f"{GitHubUserAPI.URL}/users/{self.username}"
        self._get_request(request)

    def get_user_repositories(self):
        self.get_user_info()
        request = self.last_response['repos_url']
        self._get_request(request)

    def save_to_json(self):
        with open('output.json', 'w') as f:
            json.dump(self.last_response, f)


git_api = GitHubUserAPI(USERNAME)
git_api.get_user_repositories()
git_api.save_to_json()

print()
