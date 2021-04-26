# Adapted from https://github.com/Ijeamakaanyene/ijeamaka-anyene/blob/master/R/functions.R  

create_card <- function(title=NULL, description=NULL, tech=NULL, source=NULL, url=NULL, img_src=NULL){
    # create defaults  
    if (is.null(img_src)){
        img_src <- "images/wip.jpg"
    }
    if (is.null(url)){
        url <- "https://www.example.com"
    }
    if(is.null(title)){
        title <- "Lorem Ipsum"
    }
    if(is.null(description)){
        description <- "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
    }
    
    # check that tech has to be a vector of strings  
    if (!is.vector(tech)){
        stop("tech has to be a vector")
    } 
    if (!is.character(tech)){
        stop("tech has to be a string")
    }
    # create tech string as a list of list to hold html elements 
    tech_string <- vector(mode = "list", length=length(tech))
    for (i in seq_along(tech)){
        tech_string[[i]] <- htmltools::code(tech[i])
    }
    html_code <- tags$div(
        class = "card",
        tags$img(class="card-img-top",
                 src=img_src),
        tags$div(
            class = "card-body",
            h4(
                a(href = url,  
                  title)),
            h5(a(href = source,
                 strong("Source Code"))),
            p(class = "card-text", 
              description, br(), strong("Built Using:"), tech_string)
        )
    )
    return(html_code)
    
}

