function myFunction() {
  // Get the checkbox
  var checkBox = document.getElementById("roles");
  // Get the output text
  var text = document.getElementById("tecnico");
  // If the checkbox is checked, display the output text
  if (checkBox.checked == true){
    text.style.display = "block";
  } else {
    text.style.display = "none";
  }
}

function showClientOffer() {
  // Get the output text
	  var text = document.getElementById("client_offer"); 
	  text.style.display = "block";
}

function showTechnicianOffer() {
// Get the output text
	  var text = document.getElementById("technician_offer");
	    text.style.display = "block";
}
function showOfferForm(){
	var button = document.getElementById("offer_button");
	button.style.display = "none";
	var form = document.getElementById("offer_form");
	form.style.display = "block";
}

function showTechnicianButtons(id){
	var divInProccess = document.getElementById("in_proccess");
	var divFinished = document.getElementById("finished");
	var divDelivered = document.getElementById("delivered");
	
	
	if (id == "ACCEPTED"){
		
		divInProccess.style.display ="block";
		divFinished.style.display ="none";
		divDelivered.style.display ="none";
		
	}else if(id == "INPROCCESS"){
		divFinished.style.display ="block";
		divInProccess.style.display ="none";
		divDelivered.style.display ="none";
	}
	else if (id == "FINISHED"){
		
		divDelivered.style.display ="block";
		divInProccess.style.display ="none";
		divFinished.style.display ="none";
	}
	else {
		divDelivered.style.display ="none";
		divInProccess.style.display ="none";
		divFinished.style.display ="none";
	}
}

function showUserButtons(id){
	var divRatingButton = document.getElementById("confirm");
	
	if (id == "DELIVERED"){
		divRatingButton.style.display ="block";
	}
	else{
		divRatingButton.style.display ="none";
	}
	
	
	
}

function showRatingForm(){
	var divButton = document.getElementById("confirm");
	var divForm = document.getElementById("ratingForm");
	
	divButton.style.display ="none";
	divForm.style.display ="block";
	
}

/*-----------------------FUNCIONES ESTRELLAS--------------------*/
//Starrr plugin (https://github.com/dobtco/starrr)
var __slice = [].slice;

(function($, window) {
  var Starrr;

  Starrr = (function() {
    Starrr.prototype.defaults = {
      rating: void 0,
      numStars: 5,
      change: function(e, value) {}
    };

    function Starrr($el, options) {
      var i, _, _ref,
        _this = this;

      this.options = $.extend({}, this.defaults, options);
      this.$el = $el;
      _ref = this.defaults;
      for (i in _ref) {
        _ = _ref[i];
        if (this.$el.data(i) != null) {
          this.options[i] = this.$el.data(i);
        }
      }
      this.createStars();
      this.syncRating();
      this.$el.on('mouseover.starrr', 'span', function(e) {
        return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      this.$el.on('mouseout.starrr', function() {
        return _this.syncRating();
      });
      this.$el.on('click.starrr', 'span', function(e) {
        return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      this.$el.on('starrr:change', this.options.change);
    }

    Starrr.prototype.createStars = function() {
      var _i, _ref, _results;

      _results = [];
      for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
        _results.push(this.$el.append("<span class='ion-ios-star-outline'></span>"));
      }
      return _results;
    };

    Starrr.prototype.setRating = function(rating) {
      if (this.options.rating === rating) {
        rating = void 0;
      }
      this.options.rating = rating;
      this.syncRating();
      return this.$el.trigger('starrr:change', rating);
    };

    Starrr.prototype.syncRating = function(rating) {
      var i, _i, _j, _ref;

      rating || (rating = this.options.rating);
      if (rating) {
        for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
          this.$el.find('span').eq(i).removeClass('ion-ios-star-outline').addClass('ion-ios-star');
        }
      }
      if (rating && rating < 5) {
        for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
          this.$el.find('span').eq(i).removeClass('ion-ios-star').addClass('ion-ios-star-outline');
        }
      }
      if (!rating) {
        return this.$el.find('span').removeClass('ion-ios-star').addClass('ion-ios-star-outline');
      }
    };

    return Starrr;

  })();
  return $.fn.extend({
    starrr: function() {
      var args, option;

      option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      return this.each(function() {
        var data;

        data = $(this).data('star-rating');
        if (!data) {
          $(this).data('star-rating', (data = new Starrr($(this), option)));
        }
        if (typeof option === 'string') {
          return data[option].apply(data, args);
        }
      });
    }
  });
})(window.jQuery, window);

$(function() {
  return $(".starrr").starrr();
});

$( document ).ready(function() {
      
  $('#stars').on('starrr:change', function(e, value){
    $('#count').html(value);
  });
  
  $('#stars-existing').on('starrr:change', function(e, value){
    $('#count-existing').html(value);
  });
});