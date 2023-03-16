import { LightningElement, track } from 'lwc';
import getNASAImage from '@salesforce/apex/NASAImageDataController.getNASAImageData';

export default class NASAImageComponent extends LightningElement {

    // Variables for html
    @track title = '';
    @track date = '';
    @track url = '';
    @track explanation = '';
    @track media = '';
    @track selectedDate = '';
    @track video = '';
    @track image = '';

    // Using connectedCallback instead of wire due to cacheable=false in Apex
    connectedCallback() {
        this.init();
    }

    // Call Apex and map json data
    async init() {
        if (this.selectedDate) {
            try {
                const response = await getNASAImage({picDate: this.selectedDate});
                const jsonResponse = JSON.parse(response);
                this.title = jsonResponse.title;
                this.date = jsonResponse.date;
                this.url = jsonResponse.url;
                this.explanation = jsonResponse.explanation;
                this.media = jsonResponse.media_type;
                if (this.media == 'video') {
                    this.video = true;
                }
                if (this.media == 'image') {
                    this.image = true;
                }
            } catch (error) {
                console.error(error);
            }
        }
    }

    // Get user input
    handleDateChange(event) {
        this.selectedDate = event.target.value;
        this.init();
    }
}
