$(document).ready(function() {
    /**
     * .js-feature               the global container holding the images and blocks.
     * .js-screenshot-container  an inner container holding the images.
     * .js-screenshot-block      an element to click on to change the visible image.
     *
     * Each block element and image tag should also have an attribute as such: "data-screenshot-id" with an integer
     * value which match each other. e.g.
     *
     * <div class="js-screenshot-block" data-screenshot-id="1"></div>
     *
     * with
     *
     * <div class="js-screenshot-container">
     *   <img data-screenshot-id="1">
     * </div>
     */

    $('.js-screenshot-block, .js-screenshot-container img').click(function() {
        var clickedElement = $(this);
        var globalContainer = clickedElement.parents('.js-feature');
        var screenshotContainer = globalContainer.find('.js-screenshot-container');
        var screenshotId = clickedElement.data('screenshot-id');

        if (clickedElement.is('img')) {
            var blockElement = globalContainer.find('.js-screenshot-block[data-screenshot-id="' + screenshotId + '"]');
            switchScreenshot(blockElement, globalContainer, screenshotContainer, clickedElement);
        } else {
            var screenshotElement = screenshotContainer.find('[data-screenshot-id="' + screenshotId + '"]');
            switchScreenshot(clickedElement, globalContainer, screenshotContainer, screenshotElement);
        }
    });

    /**
     * Switches the top screenshot on the stack.
     *
     * @param blockElement  the block element that matches the screenshot (e.g. the block titled "To-Do" matches the
     * screenshot about the To-Do feature).
     * @param globalContainer  div with class .js-screenshot for this section.
     * @param screenshotContainer  div with class .js-screenshot-container for this section.
     * @param screenshotElement  the screenshot to be pushed to the top of the stack.
     */
    function switchScreenshot(blockElement, globalContainer, screenshotContainer, screenshotElement) {
        // Switch the 'selected' class to the block that was just clicked on.
        globalContainer.find('.js-screenshot-block').removeClass('selected');
        blockElement.addClass('selected');

        // Move the intended screenshot to the top of the stack.
        screenshotContainer.prepend(screenshotElement);

        /**
         * In the styling, the elements must have classes as such: shot1, shot2, shot3 in order from top to bottom to
         * achieve the stacking appearance.
         *
         * Here we reset those classes on the element so they can be back in order.
         */
        var i = 1;
        screenshotContainer.find('img').each(function() {
            var thisImg = $(this);
            var classes = thisImg.attr('class');

            // Only remove the 'shot([0-9]*)' class
            thisImg.removeClass(classes.match(/shot([0-9]*)/g).shift());
            thisImg.addClass('shot' + i);
            i++;
        });
    }
});
