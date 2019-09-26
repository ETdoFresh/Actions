const puppeteer = require('puppeteer');
const fs = require('fs');

(async () => {
	
    const browser = await puppeteer.launch({args: ['--no-sandbox', '--single-process']});
    const page = await browser.newPage();

try {
    // open manual page
	await page.goto('https://license.unity3d.com/manual');
	const mailInputSelector = '#conversations_create_session_form_email',
		  passInputSelector = '#conversations_create_session_form_password';

    // wait for login redirect
	await page.waitForSelector(mailInputSelector);

    // enter credentials
	await page.type(mailInputSelector, process.env.UNITY_USERNAME);
	await page.type(passInputSelector, process.env.UNITY_PASSWORD);
	//await page.screenshot({ path: 'debug_images/01_entered_credentials.png' });

    // click submit
	await page.click('input[name=commit]');

    // wait for license upload form
	const licenseUploadfield = '#licenseFile';
	await page.waitForSelector(licenseUploadfield);
	//await page.screenshot({ path: 'debug_images/02_opened_form.png' });

    // enable interception
	await page.setRequestInterception(true);

    // upload license
	page.once("request", interceptedRequest => {
        interceptedRequest.continue({
            method: "POST",
            postData: fs.readFileSync(process.env.UNITY_ACTIVATION_FILE, 'utf8'),
            headers: { "Content-Type": "text/xml" },
        });

	});

    // set license to be personal
	await page.goto('https://license.unity3d.com/genesis/activation/create-transaction');
	//await page.screenshot({ path: 'debug_images/03_created_transaction.png' });
	
    page.once("request", interceptedRequest => {
        interceptedRequest.continue({
            method: "PUT",
            postData: JSON.stringify({ transaction: { serial: { type: "personal" } } }),
            headers: { "Content-Type": "application/json" }
        });
    });
    
    // get license content
    await page.goto('https://license.unity3d.com/genesis/activation/update-transaction');
    //await page.screenshot({ path: 'debug_images/04_updated_transaction.png' });
    page.once("request", interceptedRequest => {
        interceptedRequest.continue({
            method: "POST",
            postData: JSON.stringify({}),
            headers: { "Content-Type": "application/json" }
        });
    });

    // write license
    page.on('response', async response => {  
        try {
            const data = await response.text();
            const dataJson = await JSON.parse(data);
            fs.writeFileSync(process.env.UNITY_LICENSE_FILE, dataJson.xml);
            console.log('license file written.');   
	    //await page.screenshot({ path: 'debug_images/05_received_license.png' });
        } catch (e) {
            console.log(e);
            console.log('failed to write license file.');
        }
    });
    await page.goto('https://license.unity3d.com/genesis/activation/download-license');
    await page.waitFor(1000);
    await browser.close();
}
catch(err) {
    console.log("LICENSE.JS ERROR: ", err);
}
})();
