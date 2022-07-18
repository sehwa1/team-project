//import { func } from "prop-types";

const API_KEY = 'api_key=5b702ddc0bb968582000c2a7d1d2d83e';
const BASE_URL = 'https://api.themoviedb.org/3';
const API_URL = BASE_URL + '/discover/movie?language=ko-KR&sort_by=popularity.desc&'+API_KEY;

const IMG_URL = 'https://image.tmdb.org/t/p/w500';
const searchURL =  BASE_URL + '/search/movie?language=ko-KR&'+API_KEY;

const main = document.getElementById('main');
const form = document.getElementById('form');
const search = document.getElementById('search');

getMovies(API_URL);

function getMovies(url){
    fetch(url).then(res => res.json()).then(data => {
        
        
        console.log(data.results);
        showMovies(data.results);
    })
}

function showMovies(data){
    main.innerHTML ='';

    data.forEach(movie => {
        const {title, poster_path, vote_average, 
            overview} = movie;
        const movieEl = document.createElement('div');
        movieEl.classList.add('movie');
        movieEl.innerHTML= `
        <a href=""> 
<img src="${IMG_URL + poster_path}" alt="${title}">
</a>

        <div class="movie-info">
            <h3>${title}</h3>
            <span class="${getColor(vote_average)}">${vote_average}</span>
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

function getColor(vote){
    if(vote >= 8){
        return 'green'
    }
    else if(vote >= 5){
        return "orange"
    }
    else{
        return 'red'
    }
}


form.addEventListener('submit',(e)=>{
    e.preventDefault();

    const searchTerm = search.value;

    if(searchTerm){
        getMovies(searchURL+'&query='+searchTerm)
    }else{
        getMovies(API_URL);
    }
})