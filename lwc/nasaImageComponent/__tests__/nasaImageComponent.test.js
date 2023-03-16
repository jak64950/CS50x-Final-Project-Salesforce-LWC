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

    it('displays NASA image data when given a valid date', () => {
        // Arrange
        const element = createElement('c-nasa-image-component', {
            is: NasaImageComponent
        });
        element.selectedDate = '2023-02-11';

        // Act
        document.body.appendChild(element);

        // Assert
        return Promise.resolve().then(() => {
            expect(getNASAImage).toHaveBeenCalledWith({picDate: '2023-02-11'});
            expect(element.title).toBe('Universe');
            expect(element.date).toBe('2023-02-11');
            expect(element.url).toBe('https://example.com/image.jpg');
            expect(element.explanation).toBe('A beautiful image of the universe.');
            expect(element.media).toBe('image');
            expect(element.video).toBe(false);
            expect(element.image).toBe(true);
        });
    });

    it('does not display NASA image data when given an invalid date', () => {
        // Arrange
        const element = createElement('c-nasa-image-component', {
            is: NasaImageComponent
        });
        element.selectedDate = 'invalid-date';

        // Act
        document.body.appendChild(element);

        // Assert
        return Promise.resolve().then(() => {
            expect(getNASAImage).not.toHaveBeenCalled();
            expect(element.title).toBe('');
            expect(element.date).toBe('');
            expect(element.url).toBe('');
            expect(element.explanation).toBe('');
            expect(element.media).toBe('');
            expect(element.video).toBe(false);
            expect(element.image).toBe(false);
        });
    });
});

jest.mock('@salesforce/apex', () => {
    return {
        getNASAImage: jest.fn().mockImplementation((params) => {
            if (params.picDate === '2023-02-11') {
                return Promise.resolve(JSON.stringify({
                    title: 'Universe',
                    date: '2023-02-11',
                    url: 'https://example.com/image.jpg',
                    explanation: 'A beautiful image of the universe.',
                    media_type: 'image'
                }));
            } else {
                return Promise.reject();
            }
        })
    };
});