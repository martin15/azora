$(function() {
  var approachingBottomOfPage, content, isLoadingNextPage, nextPage, viewMore, waitedLongEnoughBetweenPages;
  content = $('#lightgallery');
  viewMore = $('#view-more');
  isLoadingNextPage = false;

  approachingBottomOfPage = function() {
    return($(window).scrollTop() > $(document).height() - $(window).height() - 375)
  };
  nextPage = function() {
    var url;
    url = $('#view-more').find('a').attr('href');
    if (isLoadingNextPage || !url) {
      return;
    }
    viewMore.show('fast');
    isLoadingNextPage = true;
    lastLoadAt = new Date();
    return $.ajax({
      url: url,
      method: 'GET',
      dataType: 'script',
      success: function() {
        viewMore.hide('fast');
        isLoadingNextPage = false;
        return lastLoadAt = new Date();
      }
    });
  };
  $(window).scroll(function() {
    if (approachingBottomOfPage()) {
      return nextPage();
    }
  });
  return viewMore.find('a').click(function(e) {
    nextPage();
    return e.preventDefaults();
  });
});
