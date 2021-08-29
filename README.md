# Pre-work - *Tispy*

**Tipsy** is a tip calculator application for iOS.

Submitted by: **Murtaza**

Time spent: **14** hours spent in total

## User Stories

The following **required** functionality is complete:

* [ Y ] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [ Y ] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [ Y ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ Y ] Using locale-specific currency and currency thousands separators.
* [ Y ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!
- 1 through 5 star rating system. Each star has a customizable tip value.
- Dark mode toggle available in app
- App Icon
- Percentage value fields have number formatting and are lenient
- Group size field which divides tip amongst number of people

**Future** features to be implemented:

- Save entries to refer back to spendings on a previous occasion
- Autoresizing so view is available on smaller-screen devices (Tested on iPhone 11)

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://gfycat.com/downrightklutzybluefish.gif' width='' alt='Video Walkthrough' />

## Notes

Describe any challenges encountered while building the app.

- Understanding how to convert between NSNumber, String, and Double while working with the NumberFormatter, Views, and UserDefaults 
- Ensuring the data is refreshed whenever the main is shown
- Issues with forcing darkMode to properly change NavBar tint


## License

    Copyright [2021] [murfasa]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
