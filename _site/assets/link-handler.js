/**
 * Link Handler for GitHub Pages
 * Automatically removes .html extensions from internal links
 */
(function() {
    'use strict';
    
    // Function to remove .html extension from URLs
    function removeHtmlExtension(url) {
        return url.replace(/\.html$/, '');
    }
    
    // Function to check if a URL is internal
    function isInternalLink(url) {
        var link = document.createElement('a');
        link.href = url;
        return link.hostname === window.location.hostname;
    }
    
    // Update all links on page load
    function updateLinks() {
        var links = document.querySelectorAll('a[href]');
        
        links.forEach(function(link) {
            var href = link.getAttribute('href');
            
            // Skip if it's an external link, anchor, or already processed
            if (!href || 
                href.startsWith('#') || 
                href.startsWith('mailto:') || 
                href.startsWith('tel:') || 
                href.startsWith('javascript:') ||
                !isInternalLink(href)) {
                return;
            }
            
            // Remove .html extension if present
            if (href.endsWith('.html')) {
                var newHref = removeHtmlExtension(href);
                link.setAttribute('href', newHref);
            }
        });
    }
    
    // Handle form submissions that might have .html in action
    function updateForms() {
        var forms = document.querySelectorAll('form[action]');
        
        forms.forEach(function(form) {
            var action = form.getAttribute('action');
            
            if (action && action.endsWith('.html') && isInternalLink(action)) {
                form.setAttribute('action', removeHtmlExtension(action));
            }
        });
    }
    
    // Initialize when DOM is loaded
    function init() {
        updateLinks();
        updateForms();
        
        // Also handle dynamically added links
        var observer = new MutationObserver(function(mutations) {
            mutations.forEach(function(mutation) {
                if (mutation.type === 'childList') {
                    mutation.addedNodes.forEach(function(node) {
                        if (node.nodeType === 1) { // Element node
                            // Check if the node itself is a link
                            if (node.tagName === 'A' && node.href) {
                                var href = node.getAttribute('href');
                                if (href && href.endsWith('.html') && isInternalLink(href)) {
                                    node.setAttribute('href', removeHtmlExtension(href));
                                }
                            }
                            
                            // Check for links within the added node
                            var childLinks = node.querySelectorAll && node.querySelectorAll('a[href]');
                            if (childLinks) {
                                childLinks.forEach(function(link) {
                                    var href = link.getAttribute('href');
                                    if (href && href.endsWith('.html') && isInternalLink(href)) {
                                        link.setAttribute('href', removeHtmlExtension(href));
                                    }
                                });
                            }
                        }
                    });
                }
            });
        });
        
        observer.observe(document.body, {
            childList: true,
            subtree: true
        });
    }
    
    // Start when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})(); 