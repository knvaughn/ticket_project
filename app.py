from bottle import route, template, run, TEMPLATE_PATH, static_file, request
import json

TEMPLATE_PATH.insert(0, 'views')

@route('/create_ticket', method=['GET', 'POST'])
def handle_form():
    if request.POST:
        # Get the form data
        subject = request.forms.get('subject')
        description = request.forms.get('description')
        email = request.forms.get('email')
        # Package the data for the API using a Python dictionary, then converting it to JSON
        data = {'request': {'subject': subject, 'comment': {'body': description}}}
        ticket = json.dumps(data)
        # Make the API request
    return template('ticket_form')

@route('/css/<filename>')
def send_css(filename):
    return static_file(filename, root='static/css')

run(host='localhost', port=8080, debug=True)