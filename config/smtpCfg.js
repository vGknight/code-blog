
let smtpCfg = {
    service: "SendGrid",
    port: 587,
    secure: false, // upgrade later with STARTTLS
    host: "smtp.sendgrid.net",
    auth: {
        // api_user: "apikey",
        api_key: ""
    }
};

// mail optiosn for contact form
let contactMail = {
    from: '"Code & Blog Site!" no-reply@sendgrid.net>', // sender address
    to: 'gk@snipinternet.com', // list of receivers
    subject: 'Blogger Information Request', // Subject line
    text: ''			// plain text body

};


module.exports = {

    smtpCfg: smtpCfg,
    contactMail: contactMail


}
