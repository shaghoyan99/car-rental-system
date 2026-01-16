// main.js - accessibility and UI enhancements (mobile menu toggle, simple reveal animations)
(function(){
  'use strict';

  function onDOM(fn){
    if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', fn);
    else fn();
  }

  function formatDates(){
    try{
      var nodes = document.querySelectorAll('.cly-date');
      if(!nodes || nodes.length===0) return;
      var fmt = new Intl.DateTimeFormat(undefined, { day: 'numeric', month: 'short', year: 'numeric' });
      nodes.forEach(function(n){
        var raw = n.getAttribute('data-date');
        if(!raw) return;
        // raw likely LocalDate.toString() => ISO yyyy-MM-dd
        var parts = raw.split('-');
        var year = parseInt(parts[0],10), month = parseInt(parts[1],10)-1, day = parseInt(parts[2],10);
        var d = new Date(Date.UTC(year, month, day));
        n.textContent = fmt.format(d);
        n.setAttribute('aria-label', fmt.format(d));
      });
    }catch(e){console.error('formatDates error', e);}
  }

  onDOM(function(){
    // Mobile nav toggle
    var toggle = document.getElementById('cly-nav-toggle');
    var nav = document.getElementById('cly-main-nav');
    if (toggle && nav){
      toggle.addEventListener('click', function(){
        var expanded = toggle.getAttribute('aria-expanded') === 'true';
        toggle.setAttribute('aria-expanded', String(!expanded));
        nav.classList.toggle('is-open');
      });
    }

    // Date formatting
    formatDates();

    // Respect user's reduced motion preference for reveals
    var reduce = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    if (!reduce && 'IntersectionObserver' in window){
      var observer = new IntersectionObserver(function(entries){
        entries.forEach(function(e){
          if (e.isIntersecting) e.target.classList.add('reveal');
        });
      }, { threshold: 0.15 });

      document.querySelectorAll('.cly-card, .cly-vehicle-card, .cly-booking-card, .cly-form-card').forEach(function(el){
        observer.observe(el);
      });
    }

    // Skip link: focus main content for keyboard users
    var skip = document.querySelector('.cly-skip-link');
    if (skip){
      skip.addEventListener('click', function(){
        var content = document.getElementById('content');
        if (content){
          content.setAttribute('tabindex', '-1');
          content.focus();
        }
      });
    }
  });
})();
