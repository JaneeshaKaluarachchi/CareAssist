// Toggle Sidebar (☰ Menu)
function toggleMenu() {
    const sidebar = document.getElementById("sidebar");
    sidebar.classList.toggle("open");
}

// Close Sidebar
function closeMenu() {
    document.getElementById("sidebar").classList.remove("open");
}

// Show Consult Now Modal
function showConsultModal() {
    document.getElementById("consultModal").style.display = "flex";
}

// Close Consult Now Modal
function closeConsultModal() {
    document.getElementById("consultModal").style.display = "none";
}

// Close modal when clicking outside
window.onclick = function(event) {
    if (event.target == document.getElementById("consultModal")) {
        closeConsultModal();
    }
};

// Toggle dropdown menu on click for Services
document.querySelector('.dropdown').addEventListener('click', function(event) {
    event.stopPropagation(); // Prevent event from propagating to the window click listener
    const dropdownMenu = this.querySelector('.dropdown-menu');
    dropdownMenu.classList.toggle('show'); // Toggle visibility
});

// Close dropdown if clicked outside
window.addEventListener('click', function(event) {
    const dropdownMenu = document.querySelector('.dropdown-menu');
    const dropdown = document.querySelector('.dropdown');
    if (dropdownMenu && !dropdown.contains(event.target)) {
        dropdownMenu.classList.remove('show');
    }
});

// Dynamically Add Links to Sidebar
function updateSidebarLinks() {
    const sidebarLinks = document.getElementById("sidebar-links");
    sidebarLinks.innerHTML = ""; // Clear current links

    // Extra Links (Always in ☰ Menu)
    const extraLinks = `
        <li><a href="contact.html">Contact Us</a></li>
        <li><a href="articles.html">Articles</a></li>
        <li><a href="faq.html">FAQ</a></li>
        <li><a href="loyalty.html">Loyalty Card</a></li>
    `;

    // On mobile (less than 768px), add navbar links + extra links to sidebar
    if (window.innerWidth <= 768) {
        const navbarLinks = document.querySelector(".nav-links");
        sidebarLinks.appendChild(navbarLinks.cloneNode(true)); // Add navbar links
    }

    sidebarLinks.innerHTML += extraLinks; // Add extra links
}

// Run function on page load and window resize
window.addEventListener("load", updateSidebarLinks);
window.addEventListener("resize", updateSidebarLinks);