class MobileMenu {
  constructor() {
      this.DOM = {};
      this.DOM.btn = document.querySelector('.mobile-menu__btn');
      this.DOM.cover = document.querySelector('.mobile-menu__cover');
      this.DOM.container = document.querySelector('#global-container');
      this._addEvent();
  }

 

  _toggle() {
      this.DOM.container.classList.toggle('menu-open');
  }

  _addEvent() {
      this.DOM.btn.addEventListener("click", this._toggle.bind(this));
      this.DOM.cover.addEventListener("click", this._toggle.bind(this));
  }
}

new MobileMenu();

const topUs = document.querySelector(".about-us")
const bestTweet = document.querySelector(".best-tweet")
const tweetList = document.querySelector(".tweet-list")
const cb = function(entries,observer){
  entries.forEach(entry=>{
    if(entry.isIntersecting){
      entry.target.classList.add("active")
      console.log("active")
    }
    // } else {
    //   entry.target.classList.remove("active")
    //   console.log("non-active")
    // }
  });
}
const options = {
 root: null,
 rootMargin: '-100px 0px -100px 0px',
 threshold: 0
}
const io = new IntersectionObserver(cb,options)
io.observe(topUs)
io.observe(bestTweet)
io.observe(tweetList)