{

    let pointOneCoordinates;
    let pointTwoCoordinates;

    let coArray = [[136, 62]]

    let line = document.getElementById(`line`);
    let distanceText = document.getElementById(`distance`);
    let hiddenCoordinates = document.getElementById(`coordinates`);
    let form = document.getElementById(`form`);
    const coordinatesButton = document.getElementById(`coordinatesButton`);
    
    
    
    
    const init = () => {
        getPointCoordinates();
        form.addEventListener("submit", handleForm);
        coordinatesButton.addEventListener('click', e => changeCoordinates(e, pointTwoCoordinates));


    }   

    const getPointCoordinates = () => {
        // let pointOne = document.getElementById(`point1`);
        // let pointTwo = document.getElementById(`point2`);
        let pointOne = document.getElementById(`point1`);
        let pointTwo = document.getElementById(`point2`);

        pointOneCoordinates = pointOne.getBoundingClientRect();
        pointTwoCoordinates = pointTwo.getBoundingClientRect();

        console.log([pointOneCoordinates, pointTwoCoordinates]);

        createLine(pointOneCoordinates.x, pointOneCoordinates.y, pointTwoCoordinates.x, pointTwoCoordinates.y);
        //changeCoordinates(pointTwoCoordinates);
        
    }

    const createLine = (x1,y1,x2,y2) => {
        let distance = Math.sqrt(((x1-x2) * (x1-x2)) + ((y1-y2) * (y1-y2)));

        let xMid = (x1+x2) /2;
        let yMid = (y1+y2) /2;

        let salopeInRadian = Math.atan2(y1 - y2, x1 - x2);
        let salopeInDegrees = (salopeInRadian * 180) / Math.PI;

        // Change the css of the line

        line.style.width = distance;
        line.style.top = yMid + 9 ;
        line.style.left = xMid - (distance / 2);
        line.style.transform = "rotate("+salopeInDegrees+"deg)";

    }

    const changeCoordinates = (e, pointTwoCoordinates) => {
        e.preventDefault();
        console.log("het formulier werd verstuurd");


        //Change value of form and put it in a variable
        hiddenCoordinates.value = [pointTwoCoordinates.x, pointTwoCoordinates.y];
        console.log(hiddenCoordinates.value);

        let hiddenCoordinatesValue = hiddenCoordinates.value.replace(",", " ").split(/\s+/);

        console.log(hiddenCoordinatesValue);

    }

    const handleForm = e => {
        e.preventDefault();
        console.log("het formulier werd verstuurd");
        //console.log("het formulier werd verstuurd");
        // //Change value of form and put it in a variable
        // hiddenCoordinates.value = [pointTwoCoordinates.x, pointTwoCoordinates.y];
        // console.log(hiddenCoordinates.value);

        // let hiddenCoordinatesValue = hiddenCoordinates.value.replace(",", " ").split(/\s+/);

        // console.log(hiddenCoordinatesValue);

    

    }

    init();
}