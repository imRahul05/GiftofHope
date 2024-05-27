const form = document.querySelector('form')

form.addEventListener('submit', function(e){
    e.preventDefault()

    const height = parseInt(document.querySelector('#height').value);
    const weight = parseInt(document.querySelector('#weight').value);
    const results = document.querySelector('#results')

    if((height===''|| height < 0 ||isNaN(height))&& (weight===''|| weight < 0 || isNaN(weight)))
       results.innerHTML = `Please give a proper Height and Weight in Cms and Kgs ${height} ${weight}`;


    else if(height===''|| height < 0 ||isNaN(height)){
        results.innerHTML = `Please give a proper Height in Cms ${height}`;
    
    }
    else if(weight===''|| weight < 0 || isNaN(weight)){
        results.innerHTML = `Please give a proper Weight in Kgs ${weight}`;
    }else{
        const bmi = ((weight/(height*height))*10000).toFixed(2);
        if (bmi<18.6){
            results.innerHTML = `Your BMI is ${bmi} and you are underweight`;
        }
        else if(bmi>=18.6 && bmi<25){
            results.innerHTML = `Your BMI is ${bmi} and you are normal`;
        }
        else {
            results.innerHTML = `Your BMI is ${bmi} and you are overweight`;
        }

    }
   
});