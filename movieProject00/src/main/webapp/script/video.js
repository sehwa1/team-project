movie1 = 'https://www.youtube.com/embed//GduEtmvwcI0?autoplay=1&mute=1&controls=0&apm;playlist=GduEtmvwcI0&apm;loop=1';
movie2 = 'https://www.youtube.com/embed//qoXf5Zr3BhA?autoplay=1&mute=1&control=0&apm;playlist=qoXf5Zr3BhA&apm;loop=1';
movie3 = 'https://www.youtube.com/embed//7Q70_m-59O8?autoplay=1&mute=1&control=0&apm;playlist=7Q70_m-59O8&apm;loop=1';
movie4 = 'https://www.youtube.com/embed//a7Liol7o9H8?autoplay=1&mute=1&control=0&apm;playlist=a7Liol7o9H8&apm;loop=1';
movie5 = 'https://www.youtube.com/embed//sfndyw8V4Q8?autoplay=1&mute=1&control=0&apm;playlist=sfndyw8V4Q8&apm;loop=1';

const videos = [movie1, movie2, movie3, movie4, movie5];

const chsenVideo = videos[Math.floor(Math.random() * videos.length)];

const insert = document.getElementById('video');

const videoBack = document.createElement('div');
videoBack.className = 'embed-container';

const bgVideo = document.createElement('iframe');
bgVideo.setAttribute("src", chsenVideo);
bgVideo.setAttribute('frameborder', 0);
bgVideo.setAttribute('allowfullscreen', 'allowfullscreen');

videoBack.append(bgVideo);
insert.append(videoBack);