$( document ).ready(function() {

    fetch("https://api.github.com/repos/thinkr-open/golem")
      .then((data) =>{
        data.json().then((res) => {
          let content = document.createElement("h3")
          content.innerText =res.stargazers_count
          $("#github").append(content)
        })
        .catch((error) => {
          console.log("Error catchin result from API")
        })
      })
      .catch((error) => {
        console.log("Error catchin result from API")
      })
});
