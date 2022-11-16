from pytube import YouTube
def Download(link):
    youtubeObject=YouTube(link)
    youtubeObject=youtubeObject.streams.get_highest_resolution()
    try:
        youtubeObject.download()
    except:
        print("an errror occured")
        
link=input("Enter the link url")
Download(link)