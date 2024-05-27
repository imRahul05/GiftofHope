const btn = document.querySelectorAll('.button');
const body = document.querySelector('body');


btn.forEach(function (button){
    console.log('button')
    button.addEventListener('click',function(e){
        console.log(e)
        console.log(e.target)
        console.log(e.target.classList)
        if(e.target.id === 'grey')
            body.style.backgroundColor = 'grey';
        else if(e.target.id === 'blue')
            body.style.backgroundColor = 'blue';
        else if(e.target.id === 'green')
            body.style.backgroundColor = 'green';
        else if(e.target.id === 'yellow')
            body.style.backgroundColor = 'yellow';
       
    })
});     