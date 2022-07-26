const API_KEY = 'api_key=5b702ddc0bb968582000c2a7d1d2d83e';
const BASE_URL = 'https://api.themoviedb.org/3';

const API_URL = BASE_URL + '/discover/movie?language=ko-KR&sort_by=popularity.desc&'+API_KEY;
const test = 'https://api.themoviedb.org/3/movie/207703?api_key=5b702ddc0bb968582000c2a7d1d2d83e&language=en-US';
const IMG_URL = 'https://image.tmdb.org/t/p/w500';
const searchURL =  BASE_URL + '/search/movie?language=ko-KR&'+API_KEY;

const Video_URL= 'https://www.youtube.com/embed/${video}?autoplay=1&mute=1&loop=1&modestbranding=1&playlist=${video}&controls=0';

getMovies(test);
const main = document.getElementById('main');

function getMovies(url){
    fetch(url).then(res => res.json()).then(data => {
        
       
        console.log(data.results);
        showDetails(data.results);
    })
}

function showDetails(data){
	 main.innerHTML ='';
	    data.forEach(movie => {
	        const {title, poster_path, vote_average, 
	            overview, release_date,genre_ids,vote_count
,production_companies, status, backdrop_path, runtime, video} = movie;
	        const movieEl = document.createElement('div');
	        movieEl.classList.add('movie');
	        movieEl.innerHTML= `

<div class="title">
	        <h1>제목: ${title}</h1>
	        </div>

	        <div class="image">
	        	<img src="${IMG_URL + poster_path}" 
	        </div>

 <div class="image"> 귀여운사진 <br>
	        	<img src="${IMG_URL + backdrop_path}" 
	        </div>
	      
  <div class="runtime">
	        <h3>상영시간: ${runtime}</h3>
	        </div>


<div class="genre">
	        <h3>장르: ${genre_ids}</h3>
	        </div>

<div class="company">
	        <h3>배급사: ${production_companies}</h3>
	        </div>

	        
	        <div class="vote_avg">
	        <h3>평점: ${vote_average}</h3>
	        </div>

 <div class="vote_cnt">
	        <h3>추천수: ${vote_count}</h3>
	        </div>


	        
	        <div class="release">
	        <h3>개봉일: ${release_date}</h3>
	        </div>

    <div class="status">
	        <h3>상영여부: ${status}</h3>
	        </div>
	        
	        <div class="overview">
            <h3>줄거리</h3>
            ${overview}
        </div>
        `
	main.appendChild(movieEl);
	       //main.appendChild(movieEl);
	    })
}