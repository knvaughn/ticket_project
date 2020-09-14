from bottle import route, template, run, TEMPLATE_PATH, static_file, request
import json
import requests

TEMPLATE_PATH.insert(0, 'views')

@route('/create_ticket', method=['GET', 'POST'])
def handle_form():
    status = ''
    validation = False
    if request.POST:

        # Determine which form was submitted
        

        # Get the form data
        subject = request.forms.get('subject')
        description = request.forms.get('description')
        email = request.forms.get('email')
        # Package the data for the API using a Python dictionary, then convert it to JSON
        data = {'request': {'subject': subject, 'comment': {'body': description}}}

        ticket = json.dumps(data)
        # Make the API request
        user = email + '/token'
        api_token = 'goN6RPMt0DbCkHM0ZL2YX9qL30eCpAUexQuIcC7A'
        url = 'https://rocketfiber.zendesk.com/api/v2/requests.json'
        headers = {'content-type': 'application/json'}
        # Response variable r
        r = requests.post(
            url,
            data=ticket,
            auth=(user, api_token),
            headers=headers
        )
        if r.status_code != 201:
            if r.status_code == 401 or 422:
                status = 'Could not authenticate your account based on the email provided. Check your email address or call 844-847-6253 for support.'
            else:
                status = 'Problem with the request. Status ' + str(r.status_code)
        else:
            status = 'Ticket was created! Look for an email notification.'
            validation = True
    return template('ticket_form', feedback=status, form_validation=validation)

@route('/css/<filename>')
def send_css(filename):
    return static_file(filename, root='static/css')

@route('/js/<filename>')
def send_js(filename):
    return static_file(filename, root='static/js')

@route('/img/<filename>')
def send_img(filename):
    return static_file(filename, root='static/img')

run(host='localhost', port=8080, debug=True)