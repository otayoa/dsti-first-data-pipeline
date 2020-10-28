import urllib.request


def downloader(url):
    base = 'data/'
    filename = extract_url_filename(url)
    path = base + filename
    urllib.request.urlretrieve(url, path)


def extract_url_filename(url):
    urllist = url.split('/')
    filename = urllist[-1]
    return filename


with open('urls.txt', 'r') as file:
    for line in file:
        url = line.strip('\n')
        downloader(url)
