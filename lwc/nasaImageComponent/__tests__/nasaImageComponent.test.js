import { createElement } from 'lwc';
import NasaImageComponent from 'c/nasaImageComponent';
import { getNASAImage } from '@salesforce/apex';

describe('c-nasa-image-component', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('TODO: test case generated by CLI command, please fill in test logic', () => {
        // Arrange
        const element = createElement('c-nasa-image-component', {
            is: NasaImageComponent
        });

        // Act
        document.body.appendChild(element);

        // Assert
        // const div = element.shadowRoot.querySelector('div');
        expect(1).toBe(1);
    });
});

jest.mock('@salesforce/apex', () => {
    return {
        getNASAImage: jest.fn().mockImplementation(() => {
            return Promise.resolve(JSON.stringify({
                title: 'Test Title',
                date: '2022-01-01',
                hdurl: 'https://test.com/test.jpg',
                explanation: 'This is a test image'
            }));
        })
    };
});

describe('c-nasa-image-component', () => {
    afterEach(() => {
        jest.clearAllMocks();
    });

    it('retrieves and displays NASA image data', () => {
        const element = new nasaImageComponent();
        document.body.appendChild(element);

        return Promise.resolve().then(() => {
            expect(getNASAImage).toHaveBeenCalled();
            expect(element.title).toBe('Test Title');
            expect(element.date).toBe('2022-01-01');
            expect(element.url).toBe('https://test.com/test.jpg');
            expect(element.explanation).toBe('This is a test image');
        });
    });
});