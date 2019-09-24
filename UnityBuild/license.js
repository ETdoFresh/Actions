const puppeteer = require('puppeteer');
const fs = require('fs');

(async () => {
	
    const browser = await puppeteer.launch({
        args: ["--no-sandbox"]
    });
    const page = await browser.newPage();

    // open manual page
	await page.goto('https://license.unity3d.com/manual');
	const mailInputSelector = '#conversations_create_session_form_email',
		  passInputSelector = '#conversations_create_session_form_password';

    // wait for login redirect
	await page.waitForSelector(mailInputSelector);

    // enter credentials
	await page.type(mailInputSelector, process.env.UNITY_USERNAME);
	await page.type(passInputSelector, process.env.UNITY_PASSWORD);

    // click submit
	await page.click('input[name=commit]');

    // wait for license upload form
	const licenseUploadfield = '#licenseFile';
	await page.waitForSelector(licenseUploadfield);

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
    page.once("request", interceptedRequest => {
        interceptedRequest.continue({
            method: "PUT",
            postData: JSON.stringify({ transaction: { serial: { type: "personal" } } }),
            headers: { "Content-Type": "application/json" }
        });
    });
    
    // get license content
    await page.goto('https://license.unity3d.com/genesis/activation/update-transaction');
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
            fs.writeFileSync("Unity_v2019.x.ulf", dataJson.xml);
            console.log('license file written.');        
        } catch (e) {
            console.log(e);
            console.log('failed to write license file.');
        }
    });
    await page.goto('https://license.unity3d.com/genesis/activation/download-license');
    await page.waitFor(1000);
    await browser.close();
})();