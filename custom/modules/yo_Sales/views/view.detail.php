<?php

require_once('include/MVC/View/views/view.detail.php');

class yo_SalesViewDetail extends ViewDetail {
    /**
     * @see SugarView::display()
     *
     * We are overriding the display method to manipulate the portal information.
     * If portal is not enabled then don't show the portal fields.
     */
    public function display()
    {
		require_once('modules/AOS_PDF_Templates/formLetter.php');
		formLetter::DVPopupHtml('yo_Sales');
        parent::display();
    }
}