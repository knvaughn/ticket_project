<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/form_styles.css">
<div id="ticket_form">
<h2 class="title">I'm Interested In<span class="required_asterisk">*</span></h2>

<form id="form_shower">
  <select id="form_options">
  <option value="" selected="selected"></option>
  <option value="service_issue">Getting Help with My Service</option>
  <option value="cancel_service">Cancelling My Service</option>
  </select>
</form>

% if feedback and form_validation:
    <div class="feedback form_validation_success">{{feedback}}</div>
% elif feedback and not(form_validation):
    <div class="feedback form_validation_error">{{feedback}}</div>
% end

<!--SERVICE ISSUE FORM-->
<form id="service_issue" action="create_ticket" method="post">
  <ul>
    <li><input type="hidden" name="subject" value="Service Issue"></li>

    <li><label for="account_holder">Account Holder Full Name<span class="required_asterisk">*</span></label><input type="text" name="account_holder" class="field" required></li>

    <li><label for="service_address">Service Address<span class="required_asterisk">*</span></label><input type="text" name="service_address" class="field" required></li>

    <li><label for="unit_number">Apt. # / Unit</label><input type="text" name="unit_number" class="field"></li>

    <li><label for="email">Email<span class="required_asterisk">*</span></label><input type="email" name="email" class="field" required></li>

    <li><label for="description">Tell Us How We Can Help<span class="required_asterisk">*</span></label><textarea name="description" rows="6" class="field" required></textarea></li>

    <li><input type="submit" value="Submit"></li> 
  </ul>
</form>

<!--CANCEL SERVICE FORM-->
<form id="cancel_service" action="create_ticket" method="post">
  <ul>
    <li><input type="hidden" name="subject" value="Cancel Service"></li>

    <li><label for="account_holder">Account Holder Full Name<span class="required_asterisk">*</span></label><input type="text" name="account_holder" class="field" required></li>

    <li><label for="service_address">Service Address<span class="required_asterisk">*</span></label><input type="text" name="service_address" class="field" required></li>

    <li><label for="unit_number">Apt. # / Unit</label><input type="text" name="unit_number" class="field"></li>

    <li><label for="email">Email<span class="required_asterisk">*</span></label><input type="email" name="email" class="field" required></li>

    <li><label for="description">Tell Us How We Can Help<span class="required_asterisk">*</span></label><textarea name="description" rows="6" class="field" required></textarea></li>

    <li><input type="submit" value="Submit"></li> 
  </ul>
</form>

</div>
<script src="/js/main.js"></script>