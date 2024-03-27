# Sapice (= "Paws" in English)
Animal rescue site with admin panel, preview available here: https://sapice.etl.yt

## Description
Sapice is a comprehensive web solution designed to support local animal (mainly dogs) rescue centers. It facilitates the management of dog profiles, including details such as breed, age, characteristics, rescue information, and special needs. Additionally, Sapice features a blog where users can read and publish articles related to dogs. The platform is structured with three user roles: visitor, editor, and admin, each providing different levels of access and control over the content.

## Installation
To run Sapice locally, follow these steps:
1. Ensure you have XAMPP for OS X 8.2.0 or similar services installed.
2. Clone the repository to your local machine.
3. Import the provided SQL file to your MySQL database to set up the initial database structure.
4. Configure your local server to point to the project’s root directory.
5. Access the project through your local server’s URL.
Note: Detailed instructions on setting up XAMPP and importing SQL files can be found in their respective documentation.

## Usage
- **Visitors** can access the site to view dog profiles and read blog posts.
- **Editors** have the ability to create and edit blog posts and related images.
- **Admins** can perform all tasks, including user management and content moderation.
A demo admin account is available for previewing the admin panel functionalities with limited access rights and without the ability to make changes (https://sapice.etl.yt/Sapice_admin/login.php; user: sapice@demo.com; password: deM0S@pice!).

## Features
- Management of dog profiles with comprehensive details.
- Management of segments of dogs profiles (adding new breeds, new characterisitcs, special needs etc).
- Blogging platform for sharing and reading articles on dog care and stories.
- Role-based access control for different levels of interaction and management.
- Asynchronous front-back communication for a seamless user experience.
- User activity statistics (currently only logged in db).
  
## Technologies Used
- PHP
- MySQL
- jQuery
- AJAX
- HTML
- CSS
- Bootstrap
- Fancybox
- SimpleLightbox
- TinyMCE
  
## Contributing
Currently, Sapice is not open for public contributions as it serves as a personal portfolio project. However, feedback and suggestions are always welcome.

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.

## Contact
For any questions or to get involved, please reach out to me at irena.popovic07@gmail.com.
