<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
		 @import url('https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@0,400;0,600;1,400&family=Inter:wght@300;400;500;600;700&display=swap');
        
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
        }

        :root {
          --color-sage: #9CAF9E;
          --color-cream: #F8F6F0;
          --color-charcoal: #2D3436;
          --color-warm-white: #FEFDFB;
          --color-terracotta: #D4A574;
          --color-deep-blue: #364958;
          --color-accent-gold: #D4A574;
          --color-muted-green: #8FA685;
          --color-soft-beige: #E8E3D8;
          --color-text-primary: #2D3436;
          --color-text-secondary: #636E72;
          --color-text-muted: #74B9FF;
          
          --font-serif: 'Crimson Text', Georgia, serif;
          --font-sans: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
          
          --shadow-soft: 0 4px 20px rgba(45, 52, 54, 0.06);
          --shadow-medium: 0 8px 30px rgba(45, 52, 54, 0.08);
          --shadow-strong: 0 15px 50px rgba(45, 52, 54, 0.12);
          
          --border-radius-sm: 8px;
          --border-radius-md: 12px;
          --border-radius-lg: 16px;
        }

        body {
          font-family: var(--font-sans);
          line-height: 1.7;
          color: var(--color-text-primary);
          background: linear-gradient(135deg, var(--color-warm-white) 0%, var(--color-cream) 100%);
          letter-spacing: -0.01em;
        }

        .container {
          max-width: 1280px;
          margin: 0 auto;
          padding: 0 2rem;
        }

        /* Header */
        .header {
          background: rgba(254, 253, 251, 0.95);
          backdrop-filter: blur(20px);
          border-bottom: 1px solid rgba(156, 175, 158, 0.15);
          position: sticky;
          top: 0;
          z-index: 1000;
          transition: all 0.3s ease;
        }

        .header-content {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 1.5rem 0;
        }

        .logo {
          font-family: var(--font-serif);
          font-size: 2rem;
          font-weight: 600;
          color: var(--color-charcoal);
          text-decoration: none;
          letter-spacing: -0.02em;
          display: flex;
          align-items: center;
          gap: 0.75rem;
        }

        .logo::before {
          content: '📖';
          font-size: 1.5rem;
        }

        .nav-menu {
          display: flex;
          list-style: none;
          gap: 3rem;
          align-items: center;
        }

        .nav-menu a {
          text-decoration: none;
          color: var(--color-text-secondary);
          font-weight: 400;
          font-size: 0.95rem;
          letter-spacing: -0.01em;
          transition: all 0.3s ease;
          position: relative;
          padding: 0.5rem 0;
        }

        .nav-menu a::after {
          content: '';
          position: absolute;
          bottom: 0;
          left: 0;
          width: 0;
          height: 2px;
          background: var(--color-sage);
          transition: width 0.3s ease;
        }

        .nav-menu a:hover {
          color: var(--color-charcoal);
        }

        .nav-menu a:hover::after {
          width: 100%;
        }

        .user-actions {
          display: flex;
          gap: 1rem;
          align-items: center;
        }

        .btn {
          padding: 0.75rem 1.5rem;
          border: 2px solid transparent;
          border-radius: var(--border-radius-sm);
          cursor: pointer;
          font-weight: 500;
          font-size: 0.9rem;
          letter-spacing: -0.01em;
          transition: all 0.3s ease;
          text-decoration: none;
          display: inline-flex;
          align-items: center;
          gap: 0.5rem;
        }

        .btn-primary {
          background: var(--color-charcoal);
          color: var(--color-warm-white);
          box-shadow: var(--shadow-soft);
        }

        .btn-primary:hover {
          background: var(--color-deep-blue);
          transform: translateY(-1px);
          box-shadow: var(--shadow-medium);
        }

        .btn-outline {
          background: transparent;
          color: var(--color-charcoal);
          border-color: rgba(45, 52, 54, 0.2);
        }

        .btn-outline:hover {
          background: var(--color-charcoal);
          color: var(--color-warm-white);
          border-color: var(--color-charcoal);
          transform: translateY(-1px);
        }

        /* Hero Section */
        .search-section {
          background: linear-gradient(135deg, var(--color-deep-blue) 0%, var(--color-charcoal) 100%);
          color: var(--color-warm-white);
          padding: 6rem 0 8rem;
          text-align: center;
          position: relative;
          overflow: hidden;
        }

        .search-section::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.03'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E") repeat;
          opacity: 0.4;
        }

        .search-content {
          position: relative;
          z-index: 2;
        }

        .search-title {
          font-family: var(--font-serif);
          font-size: 3.5rem;
          margin-bottom: 1.5rem;
          font-weight: 600;
          letter-spacing: -0.02em;
          line-height: 1.2;
        }

        .search-subtitle {
          font-size: 1.25rem;
          margin-bottom: 3rem;
          opacity: 0.85;
          font-weight: 300;
          max-width: 600px;
          margin-left: auto;
          margin-right: auto;
          line-height: 1.6;
        }

        .search-form {
          display: flex;
          max-width: 680px;
          margin: 0 auto;
          gap: 1rem;
          background: rgba(255, 255, 255, 0.1);
          backdrop-filter: blur(20px);
          padding: 0.75rem;
          border-radius: var(--border-radius-lg);
          border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .search-input {
          flex: 1;
          padding: 1.25rem 1.5rem;
          border: none;
          border-radius: var(--border-radius-sm);
          font-size: 1rem;
          outline: none;
          background: var(--color-warm-white);
          color: var(--color-charcoal);
          transition: all 0.3s ease;
          font-family: var(--font-sans);
        }

        .search-input::placeholder {
          color: var(--color-text-secondary);
          font-style: italic;
        }

        .search-input:focus {
          box-shadow: 0 0 0 3px rgba(156, 175, 158, 0.3);
        }

        .search-btn {
          padding: 1.25rem 2.5rem;
          background: var(--color-terracotta);
          color: var(--color-warm-white);
          border: none;
          border-radius: var(--border-radius-sm);
          cursor: pointer;
          font-weight: 600;
          font-size: 1rem;
          letter-spacing: -0.01em;
          transition: all 0.3s ease;
          white-space: nowrap;
        }

        .search-btn:hover {
          background: #C19660;
          transform: translateY(-2px);
          box-shadow: var(--shadow-medium);
        }

        /* Categories */
        .categories-section {
          padding: 6rem 0;
          background: var(--color-warm-white);
        }

        .section-title {
          text-align: center;
          font-family: var(--font-serif);
          font-size: 2.75rem;
          margin-bottom: 1rem;
          color: var(--color-charcoal);
          font-weight: 600;
          letter-spacing: -0.02em;
        }

        .section-subtitle {
          text-align: center;
          font-size: 1.1rem;
          color: var(--color-text-secondary);
          margin-bottom: 4rem;
          font-weight: 300;
          max-width: 500px;
          margin-left: auto;
          margin-right: auto;
        }

        .categories-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
          gap: 2rem;
          margin-top: 3rem;
        }

        .category-card {
          background: var(--color-warm-white);
          padding: 2.5rem 2rem;
          border-radius: var(--border-radius-lg);
          text-align: center;
          cursor: pointer;
          transition: all 0.4s ease;
          border: 1px solid rgba(156, 175, 158, 0.15);
          box-shadow: var(--shadow-soft);
          position: relative;
          overflow: hidden;
        }

        .category-card::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          height: 3px;
          background: linear-gradient(90deg, var(--color-sage), var(--color-terracotta));
          transform: scaleX(0);
          transition: transform 0.3s ease;
        }

        .category-card:hover {
          transform: translateY(-8px);
          box-shadow: var(--shadow-strong);
          border-color: rgba(156, 175, 158, 0.3);
        }

        .category-card:hover::before {
          transform: scaleX(1);
        }

        .category-icon {
          font-size: 3rem;
          margin-bottom: 1.5rem;
          display: block;
          filter: grayscale(20%);
          transition: filter 0.3s ease;
        }

        .category-card:hover .category-icon {
          filter: grayscale(0%);
        }

        .category-name {
          font-size: 1.2rem;
          font-weight: 500;
          color: var(--color-charcoal);
          letter-spacing: -0.01em;
        }

        /* Recommended Section */
        .recommended-section {
          padding: 6rem 0;
          background: linear-gradient(135deg, var(--color-soft-beige) 0%, var(--color-cream) 100%);
          position: relative;
        }

        .recommended-title {
          text-align: center;
          font-family: var(--font-serif);
          font-size: 2.75rem;
          margin-bottom: 1rem;
          color: var(--color-charcoal);
          font-weight: 600;
          letter-spacing: -0.02em;
        }

        .recommended-subtitle {
          text-align: center;
          font-size: 1.1rem;
          margin-bottom: 4rem;
          color: var(--color-text-secondary);
          font-weight: 300;
          max-width: 500px;
          margin-left: auto;
          margin-right: auto;
        }

        .recommended-grid {
          display: grid;
          grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
          gap: 2.5rem;
          margin-top: 3rem;
        }

        .recommended-card {
          background: var(--color-warm-white);
          border-radius: var(--border-radius-lg);
          overflow: hidden;
          box-shadow: var(--shadow-soft);
          transition: all 0.4s ease;
          cursor: pointer;
          border: 1px solid rgba(156, 175, 158, 0.1);
          position: relative;
        }

        .recommended-card:hover {
          transform: translateY(-12px);
          box-shadow: var(--shadow-strong);
          border-color: rgba(156, 175, 158, 0.3);
        }

        .recommended-image {
          width: 100%;
          height: 240px;
          object-fit: cover;
          transition: transform 0.4s ease;
        }

        .recommended-card:hover .recommended-image {
          transform: scale(1.05);
        }

        .recommended-info {
          padding: 2rem;
        }

        .recommended-badge {
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          color: var(--color-warm-white);
          padding: 0.4rem 1rem;
          border-radius: 20px;
          font-size: 0.75rem;
          font-weight: 600;
          display: inline-block;
          margin-bottom: 1rem;
          letter-spacing: 0.5px;
          text-transform: uppercase;
        }

        .recommended-book-title {
          font-family: var(--font-serif);
          font-size: 1.3rem;
          font-weight: 600;
          margin-bottom: 0.5rem;
          color: var(--color-charcoal);
          line-height: 1.4;
          letter-spacing: -0.01em;
        }

        .recommended-book-author {
          color: var(--color-text-secondary);
          margin-bottom: 1rem;
          font-size: 0.95rem;
          font-weight: 400;
        }

        .recommended-book-price {
          font-size: 1.25rem;
          font-weight: 700;
          color: var(--color-terracotta);
          margin-bottom: 0.75rem;
          letter-spacing: -0.01em;
        }

        .recommended-rating {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          font-size: 0.85rem;
          color: var(--color-text-secondary);
        }

        /* Featured Books */
        .featured-section {
          padding: 6rem 0;
          background: var(--color-warm-white);
        }

        .books-grid {
          display: grid;
          grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
          gap: 2.5rem;
          margin-top: 3rem;
        }

        .book-card {
          background: var(--color-warm-white);
          border-radius: var(--border-radius-lg);
          overflow: hidden;
          box-shadow: var(--shadow-soft);
          transition: all 0.4s ease;
          cursor: pointer;
          border: 1px solid rgba(156, 175, 158, 0.1);
          position: relative;
        }

        .book-card::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background: linear-gradient(135deg, rgba(156, 175, 158, 0.05), rgba(212, 165, 116, 0.05));
          opacity: 0;
          transition: opacity 0.3s ease;
          z-index: 1;
        }

        .book-card:hover::before {
          opacity: 1;
        }

        .book-card:hover {
          transform: translateY(-12px) scale(1.02);
          box-shadow: var(--shadow-strong);
          border-color: rgba(156, 175, 158, 0.3);
        }

        .book-image {
          width: 100%;
          height: 360px;
          object-fit: cover;
          transition: transform 0.4s ease;
          position: relative;
          z-index: 2;
        }

        .book-card:hover .book-image {
          transform: scale(1.05);
        }

        .book-info {
          padding: 2rem;
          position: relative;
          z-index: 2;
        }

        .book-title {
          font-family: var(--font-serif);
          font-size: 1.3rem;
          font-weight: 600;
          margin-bottom: 0.75rem;
          color: var(--color-charcoal);
          line-height: 1.4;
          letter-spacing: -0.01em;
        }

        .book-author {
          color: var(--color-text-secondary);
          margin-bottom: 1.25rem;
          font-size: 0.95rem;
          font-weight: 400;
        }

        .book-price {
          font-size: 1.4rem;
          font-weight: 700;
          color: var(--color-terracotta);
          margin-bottom: 1.25rem;
          letter-spacing: -0.01em;
        }

        .book-rating {
          display: flex;
          align-items: center;
          gap: 0.75rem;
          margin-bottom: 1rem;
        }

        .stars {
          color: var(--color-accent-gold);
          font-size: 1rem;
        }

        .rating-text {
          font-size: 0.85rem;
          color: var(--color-text-secondary);
          font-weight: 500;
        }

        /* More Button */
        .more-button-container {
          display: flex;
          justify-content: center;
          margin-top: 4rem;
        }

        .more-btn {
          padding: 1rem 3rem;
          background: transparent;
          color: var(--color-charcoal);
          border: 2px solid var(--color-sage);
          border-radius: var(--border-radius-sm);
          cursor: pointer;
          font-weight: 500;
          font-size: 1rem;
          letter-spacing: -0.01em;
          transition: all 0.3s ease;
          display: inline-flex;
          align-items: center;
          gap: 0.75rem;
        }

        .more-btn:hover {
          background: var(--color-sage);
          color: var(--color-warm-white);
          transform: translateY(-2px);
          box-shadow: var(--shadow-medium);
        }

        /* Newsletter */
        .newsletter-section {
          background: linear-gradient(135deg, var(--color-charcoal) 0%, var(--color-deep-blue) 100%);
          color: var(--color-warm-white);
          padding: 5rem 0;
          text-align: center;
          position: relative;
          overflow: hidden;
        }

        .newsletter-section::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background: url("data:image/svg+xml,%3Csvg width='40' height='40' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23ffffff' fill-opacity='0.02'%3E%3Cpath d='M20 20c0 11-9 20-20 20s-20-9-20-20 9-20 20-20 20 9 20 20zm-10-10v20m-10-10h20'/%3E%3C/g%3E%3C/svg%3E") repeat;
        }

        .newsletter-content {
          position: relative;
          z-index: 2;
          max-width: 600px;
          margin: 0 auto;
        }

        .newsletter-title {
          font-family: var(--font-serif);
          font-size: 2.5rem;
          margin-bottom: 1.5rem;
          font-weight: 600;
          letter-spacing: -0.02em;
        }

        .newsletter-text {
          font-size: 1.2rem;
          margin-bottom: 3rem;
          opacity: 0.85;
          font-weight: 300;
          line-height: 1.6;
        }

        .newsletter-form {
          display: flex;
          max-width: 520px;
          margin: 0 auto;
          gap: 1rem;
          background: rgba(255, 255, 255, 0.1);
          backdrop-filter: blur(20px);
          padding: 0.75rem;
          border-radius: var(--border-radius-lg);
          border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .newsletter-input {
          flex: 1;
          padding: 1.25rem 1.5rem;
          border: none;
          border-radius: var(--border-radius-sm);
          font-size: 1rem;
          outline: none;
          background: var(--color-warm-white);
          color: var(--color-charcoal);
          font-family: var(--font-sans);
        }

        .newsletter-input::placeholder {
          color: var(--color-text-secondary);
          font-style: italic;
        }

        .newsletter-btn {
          padding: 1.25rem 2.5rem;
          background: var(--color-terracotta);
          color: var(--color-warm-white);
          border: none;
          border-radius: var(--border-radius-sm);
          cursor: pointer;
          font-weight: 600;
          font-size: 1rem;
          letter-spacing: -0.01em;
          transition: all 0.3s ease;
          white-space: nowrap;
        }

        .newsletter-btn:hover {
          background: #C19660;
          transform: translateY(-2px);
        }

        /* Book Exchange Promo Section */
        .exchange-promo-section {
          background: linear-gradient(135deg, var(--color-sage) 0%, var(--color-muted-green) 100%);
          color: var(--color-warm-white);
          padding: 6rem 0;
          overflow: hidden;
          position: relative;
        }

        .exchange-promo-section::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background: url("data:image/svg+xml,%3Csvg width='80' height='80' viewBox='0 0 80 80' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3z' stroke='%23ffffff' stroke-width='1' stroke-opacity='0.1'/%3E%3C/g%3E%3C/svg%3E") repeat;
          opacity: 0.3;
        }

        .exchange-promo-content {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 4rem;
          align-items: center;
          position: relative;
          z-index: 2;
        }

        .exchange-promo-text {
          padding: 2rem 0;
        }

        .exchange-icon {
          font-size: 4rem;
          display: block;
          margin-bottom: 2rem;
          opacity: 0.9;
        }

        .exchange-promo-title {
          font-family: var(--font-serif);
          font-size: 3rem;
          margin-bottom: 1.5rem;
          font-weight: 600;
          letter-spacing: -0.02em;
          line-height: 1.2;
        }

        .exchange-promo-description {
          font-size: 1.3rem;
          margin-bottom: 3rem;
          opacity: 0.9;
          line-height: 1.7;
          font-weight: 300;
        }

        .exchange-stats {
          display: flex;
          gap: 3rem;
          margin-bottom: 3rem;
        }

        .exchange-stat {
          text-align: left;
        }

        .exchange-stat .stat-number {
          display: block;
          font-family: var(--font-serif);
          font-size: 2.5rem;
          font-weight: 700;
          margin-bottom: 0.5rem;
          letter-spacing: -0.02em;
        }

        .exchange-stat .stat-label {
          font-size: 1rem;
          opacity: 0.8;
          font-weight: 300;
        }

        .exchange-cta-btn {
          display: inline-flex;
          align-items: center;
          gap: 0.75rem;
          background: rgba(254, 253, 251, 0.15);
          color: var(--color-warm-white);
          padding: 1.25rem 2.5rem;
          border-radius: 50px;
          text-decoration: none;
          font-weight: 600;
          font-size: 1.1rem;
          letter-spacing: -0.01em;
          transition: all 0.4s ease;
          backdrop-filter: blur(20px);
          border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .exchange-cta-btn:hover {
          background: rgba(254, 253, 251, 0.25);
          transform: translateY(-3px);
          box-shadow: var(--shadow-strong);
        }

        .exchange-promo-visual {
          display: flex;
          justify-content: center;
          align-items: center;
          padding: 2rem;
        }

        .exchange-books {
          display: flex;
          align-items: center;
          gap: 2.5rem;
        }

        .exchange-book-card {
          background: var(--color-warm-white);
          border-radius: var(--border-radius-lg);
          padding: 0.75rem;
          box-shadow: var(--shadow-strong);
          transform: rotate(-8deg);
          transition: all 0.4s ease;
        }

        .exchange-book-card:nth-child(3) {
          transform: rotate(8deg);
        }

        .exchange-book-card:hover {
          transform: rotate(0deg) scale(1.1);
        }

        .exchange-book-img {
          width: 140px;
          height: 180px;
          object-fit: cover;
          border-radius: var(--border-radius-sm);
        }

        .exchange-arrow {
          font-size: 3rem;
          color: rgba(254, 253, 251, 0.7);
          animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
          0%, 100% {
            transform: translateX(0px);
          }
          50% {
            transform: translateX(15px);
          }
        }

        /* Footer */
        .footer {
          background: linear-gradient(135deg, #1A1F2E 0%, #2D3436 100%);
          color: var(--color-warm-white);
          padding: 4rem 0 2rem;
        }

        .footer-content {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
          gap: 3rem;
          margin-bottom: 3rem;
        }

        .footer-section h3 {
          margin-bottom: 1.5rem;
          color: var(--color-warm-white);
          font-family: var(--font-serif);
          font-weight: 600;
          font-size: 1.2rem;
          letter-spacing: -0.01em;
        }

        .footer-section ul {
          list-style: none;
        }

        .footer-section ul li {
          margin-bottom: 0.75rem;
        }

        .footer-section ul li a {
          color: rgba(254, 253, 251, 0.7);
          text-decoration: none;
          transition: all 0.3s ease;
          font-size: 0.95rem;
          font-weight: 400;
        }

        .footer-section ul li a:hover {
          color: var(--color-warm-white);
          transform: translateX(5px);
        }

        .footer-bottom {
          border-top: 1px solid rgba(254, 253, 251, 0.1);
          padding-top: 2rem;
          text-align: center;
          color: rgba(254, 253, 251, 0.6);
          font-size: 0.9rem;
        }

        /* Responsive */
        @media (max-width: 768px) {
          .header-content {
            flex-direction: column;
            gap: 1rem;
          }

          .nav-menu {
            gap: 1rem;
          }

          .search-form,
          .newsletter-form {
            flex-direction: column;
          }

          .search-title {
            font-size: 2rem;
          }

          .books-grid,
          .recommended-grid {
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
          }

          .categories-grid {
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
          }

          .exchange-promo-content {
            grid-template-columns: 1fr;
            gap: 2rem;
            text-align: center;
          }

          .exchange-promo-title {
            font-size: 2rem;
          }

          .exchange-stats {
            justify-content: center;
          }

          .exchange-books {
            gap: 1rem;
          }

          .exchange-book-img {
            width: 80px;
            height: 110px;
          }

          .exchange-arrow {
            font-size: 2rem;
          }
        }
    </style>
</head>
<body>
        <div>
        {/* Header */}
        <header class="header">
          <div class="container">
            <div class="header-content">
              <a href="#" class="logo">📚 BookStore</a>
              <nav>
                <ul class="nav-menu">
                  <li><a href="#">홈</a></li>
                  <li><a href="#">베스트셀러</a></li>
                  <li><a href="#">신간</a></li>
                  <li><a href="#">카테고리</a></li>
                  <li><a href="#">이벤트</a></li>
                  <li><a href="/components/BookExchangePage.tsx">책 교환</a></li>
                </ul>
              </nav>
              <div class="user-actions">
                <a href="/components/LoginPage.tsx" class="btn btn-outline">로그인</a>
                <a href="/components/RegisterPage.tsx" class="btn btn-primary">회원가입</a>
              </div>
            </div>
          </div>
        </header>

        {/* Hero Section */}
        <section class="search-section">
          <div class="container">
            <div class="search-content">
              <h1 class="search-title">문학의 향기가 머무는 곳</h1>
              <p class="search-subtitle">소중한 이야기들이 새로운 주인을 기다리고 있습니다</p>
              <form class="search-form">
                <input 
                  type="text" 
                  class="search-input" 
                  placeholder="도서명, 저자명, 혹은 마음에 드는 구절을 입력해보세요..."
                />
                <button type="submit" class="search-btn">탐색하기</button>
              </form>
            </div>
          </div>
        </section>

        {/* Recommended Section */}
        <section class="recommended-section">
          <div class="container">
            <h2 class="recommended-title">추천 도서</h2>
            <p class="recommended-subtitle">큐레이터가 엄선한 감각적이고 깊이 있는 작품들</p>
            <div class="recommended-grid">
              <div class="recommended-card">
                <img 
                  src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=300&fit=crop"
                  alt="달러구트 꿈 백화점"
                  class="recommended-image"
                />
                <div class="recommended-info">
                  <div class="recommended-badge">베스트셀러</div>
                  <h3 class="recommended-book-title">달러구트 꿈 백화점</h3>
                  <p class="recommended-book-author">이미예</p>
                  <div class="recommended-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.2/5)</span>
                  </div>
                  <div class="recommended-book-price">13,320원</div>
                </div>
              </div>

              <div class="recommended-card">
                <img 
                  src="https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=300&fit=crop"
                  alt="세이노의 가르침"
                  class="recommended-image"
                />
                <div class="recommended-info">
                  <div class="recommended-badge">신간</div>
                  <h3 class="recommended-book-title">세이노의 가르침</h3>
                  <p class="recommended-book-author">세이노</p>
                  <div class="recommended-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.8/5)</span>
                  </div>
                  <div class="recommended-book-price">6,480원</div>
                </div>
              </div>

              <div class="recommended-card">
                <img 
                  src="https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=300&fit=crop"
                  alt="불편한 편의점"
                  class="recommended-image"
                />
                <div class="recommended-info">
                  <div class="recommended-badge">인기</div>
                  <h3 class="recommended-book-title">불편한 편의점</h3>
                  <p class="recommended-book-author">김호연</p>
                  <div class="recommended-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.3/5)</span>
                  </div>
                  <div class="recommended-book-price">12,600원</div>
                </div>
              </div>

              <div class="recommended-card">
                <img 
                  src="https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=400&h=300&fit=crop"
                  alt="클린 코드"
                  class="recommended-image"
                />
                <div class="recommended-info">
                  <div class="recommended-badge">IT 추천</div>
                  <h3 class="recommended-book-title">클린 코드</h3>
                  <p class="recommended-book-author">로버트 C. 마틴</p>
                  <div class="recommended-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.6/5)</span>
                  </div>
                  <div class="recommended-book-price">31,500원</div>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* Categories */}
        <section class="categories-section">
          <div class="container">
            <h2 class="section-title">문학의 세계로</h2>
            <p class="section-subtitle">각 장르마다 독특한 매력과 깊이를 담고 있습니다</p>
            <div class="categories-grid">
              <div class="category-card">
                <div class="category-icon">📖</div>
                <div class="category-name">소설/에세이</div>
              </div>
              <div class="category-card">
                <div class="category-icon">💼</div>
                <div class="category-name">경영/경제</div>
              </div>
              <div class="category-card">
                <div class="category-icon">🔬</div>
                <div class="category-name">과학/기술</div>
              </div>
              <div class="category-card">
                <div class="category-icon">🎨</div>
                <div class="category-name">예술/디자인</div>
              </div>
              <div class="category-card">
                <div class="category-icon">👶</div>
                <div class="category-name">아동/청소년</div>
              </div>
              <div class="category-card">
                <div class="category-icon">🎯</div>
                <div class="category-name">자기계발</div>
              </div>
              <div class="category-card">
                <div class="category-icon">💻</div>
                <div class="category-name">IT/컴퓨터</div>
              </div>
            </div>
          </div>
        </section>

        {/* Featured Books */}
        <section class="featured-section">
          <div class="container">
            <h2 class="section-title">독자들의 사랑</h2>
            <p class="section-subtitle">시간이 흘러도 변하지 않는 가치를 인정받은 작품들</p>
            <div class="books-grid">
              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=600&fit=crop&crop=face"
                  alt="달러구트 꿈 백화점"
                  class="book-image"
                />
                <div class="book-info">
                  <h3 class="book-title">달러구트 꿈 백화점</h3>
                  <p class="book-author">이미예</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.2/5)</span>
                  </div>
                  <div class="book-price">13,320원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=600&fit=crop"
                  alt="세이노의 가르침"
                  class="book-image"
                />
                <div class="book-info">
                  <h3 class="book-title">세이노의 가르침</h3>
                  <p class="book-author">세이노</p>
                  <div class="book-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.8/5)</span>
                  </div>
                  <div class="book-price">6,480원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=600&fit=crop"
                  alt="불편한 편의점"
                  class="book-image"
                />
                <div class="book-info">
                  <h3 class="book-title">불편한 편의점</h3>
                  <p class="book-author">김호연</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.3/5)</span>
                  </div>
                  <div class="book-price">12,600원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf?w=400&h=600&fit=crop"
                  alt="원피스 106권"
                  class="book-image"
                />
                <div class="book-info">
                  <h3 class="book-title">원피스 106권</h3>
                  <p class="book-author">오다 에이치로</p>
                  <div class="book-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.9/5)</span>
                  </div>
                  <div class="book-price">4,500원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1589998059171-988d887df646?w=400&h=600&fit=crop"
                  alt="아버지의 해방일지"
                  class="book-image"
                />
                <div class="book-info">
                  <h3 class="book-title">아버지의 해방일지</h3>
                  <p class="book-author">정지아</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.1/5)</span>
                  </div>
                  <div class="book-price">14,400원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=600&fit=crop"
                  alt="트렌드 코리아 2024"
                  class="book-image"
                />
                <div class="book-info">
                  <h3 class="book-title">트렌드 코리아 2024</h3>
                  <p class="book-author">김난도</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.0/5)</span>
                  </div>
                  <div class="book-price">16,200원</div>
                </div>
              </div>
            </div>
          <div class="more-button-container">
            <button class="more-btn">
              더보기 📚
            </button>
          </div>
          </div>
        </section>

        {/* Book Exchange Section */}
        <section class="exchange-promo-section">
          <div class="container">
            <div class="exchange-promo-content">
              <div class="exchange-promo-text">
                <span class="exchange-icon">🔄</span>
                <h2 class="exchange-promo-title">책의 순환</h2>
                <p class="exchange-promo-description">
                  이미 읽은 책에도 새로운 생명을 불어넣어 보세요.<br/>
                  당신의 책이 다른 이에게 새로운 감동이 될 수 있습니다.
                </p>
                <div class="exchange-stats">
                  <div class="exchange-stat">
                    <span class="stat-number">1,247</span>
                    <span class="stat-label">교환 가능한 책</span>
                  </div>
                  <div class="exchange-stat">
                    <span class="stat-number">892</span>
                    <span class="stat-label">성공한 교환</span>
                  </div>
                </div>
                <a href="/components/BookExchangePage.tsx" class="exchange-cta-btn">
                  순환의 여행 시작하기 →
                </a>
              </div>
              <div class="exchange-promo-visual">
                <div class="exchange-books">
                  <div class="exchange-book-card">
                    <img 
                      src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=200&h=260&fit=crop"
                      alt="교환 가능한 책"
                      class="exchange-book-img"
                    />
                  </div>
                  <div class="exchange-arrow">⇄</div>
                  <div class="exchange-book-card">
                    <img 
                      src="https://images.unsplash.com/photo-1512820790803-83ca734da794?w=200&h=260&fit=crop"
                      alt="교환 가능한 책"
                      class="exchange-book-img"
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* Newsletter */}
        <section class="newsletter-section">
          <div class="container">
            <div class="newsletter-content">
              <h2 class="newsletter-title">문학적 영감을 전해드립니다</h2>
              <p class="newsletter-text">신간 소식과 작가의 깊은 이야기, 독서 모임 소식을 정기적으로 받아보세요</p>
            <form class="newsletter-form">
              <input 
                type="email" 
                class="newsletter-input" 
                placeholder="이메일 주소를 남겨주세요"
              />
              <button type="submit" class="newsletter-btn">구독하기</button>
            </form>
            </div>
          </div>
        </section>

        {/* Footer */}
        <footer class="footer">
          <div class="container">
            <div class="footer-content">
              <div class="footer-section">
                <h3>고객센터</h3>
                <ul>
                  <li><a href="#">고객문의</a></li>
                  <li><a href="#">주문/배송 조회</a></li>
                  <li><a href="#">반품/교환</a></li>
                  <li><a href="#">FAQ</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>이용안내</h3>
                <ul>
                  <li><a href="#">이용약관</a></li>
                  <li><a href="#">개인정보처리방침</a></li>
                  <li><a href="#">청소년보호정책</a></li>
                  <li><a href="#">회원혜택</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>회사소개</h3>
                <ul>
                  <li><a href="#">회사정보</a></li>
                  <li><a href="#">인재채용</a></li>
                  <li><a href="#">제휴문의</a></li>
                  <li><a href="#">광고문의</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>SNS</h3>
                <ul>
                  <li><a href="#">인스타그램</a></li>
                  <li><a href="#">페이스북</a></li>
                  <li><a href="#">유튜브</a></li>
                  <li><a href="#">네이버 블로그</a></li>
                </ul>
              </div>
            </div>
            <div class="footer-bottom">
              <p>&copy; 2024 북스토어. 모든 문학적 여정을 함께합니다. | 사업자등록번호: 123-45-67890</p>
            </div>
          </div>
        </footer>
      </div>
</body>
</html>