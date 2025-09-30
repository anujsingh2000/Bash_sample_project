## Script to check endpoint by opening in defsult web browser

#Define category URLS using arrays
job_site_urls=("https://www.linkedin.com/jobs" "https://www.naukri.com/" "https://www.glassdoor.com/Job/index.htm" "https://www.indeed.com/" "https://www.monsterindia.com/")
social_media_site=("https://www.facebook.com/" "https://www.instagram.com/" "https://x.com/" "https://www.youtube.com/" "https://www.reddit.com/" )

#Function to display menu and handle user input
select_environment() {
    echo "Select environment:"
    echo "1. Job Sites"
    echo "2. Social Media Site"
    echo "3. Quit"

    read -p "Enter your choice (1-3): " choice
    case $choice in 
        1)
            open_urls "Job sites" "${job_site_urls[@]}"
            ;;
        2)
            open_urls "Social Media Site" "${social_media_site[@]}"
            ;;
        3)
            echo "Exiting script."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter number from 1 to 3."
            select_environment
            ;;
    esac
}

#Function to open urls
open_urls() {
    category_name=$1
    shift ##Remove the first argument (category name)
    urls=("$@")  ##Remaining arguments are the URLs

    echo "Opening $category_name environment: "
    for url in "${urls[@]}"; do
        echo " - $url "
        start "$url"    ##Open url in default web browser
    done
}

#Main program execution start here
select_environment