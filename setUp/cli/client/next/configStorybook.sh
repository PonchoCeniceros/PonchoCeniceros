#!/bin/bash
appName=$1
npx create-next-app@13.3.0 $appName --js --use-npm --src-dir --eslint --tailwind --no-experimental-app --import-alias "@/*" &> /dev/null
cd ./$appName
rm -f ./.storybook/preview.js
touch ./.storybook/preview.js
echo "/** @type { import('@storybook/react').Preview } */
import '../src/styles/globals.css';

const preview = {
  parameters: {
    actions: { argTypesRegex: \"^on[A-Z].*\" },
    controls: {
      matchers: {
        color: /(background|color)$/i,
        date: /Date$/,
      },
    },
  },
};

export default preview;
" >> ./.storybook/preview.js


rm -f ./.storybook/main.js
touch ./.storybook/main.js
echo "/** @type { import('@storybook/nextjs').StorybookConfig } */
const config = {
  stories: [\"../src/**/*.stories.@(js|jsx|ts|tsx)\"],
  addons: [
    \"@storybook/addon-links\",
    \"@storybook/addon-essentials\",
    \"@storybook/addon-interactions\",
    {
      name: '@storybook/addon-styling',
      options: { postCss: true },
    }
  ],
  framework: {
    name: \"@storybook/nextjs\",
    options: {},
  },
  docs: {
    autodocs: \"tag\",
  },
};
export default config;
" >> ./.storybook/main.js


rm -d -r ./src/stories
mkdir ./src/stories ./src/stories/components ./src/stories/pages
touch ./src/stories/pages/.keep ./src/stories/components/.keep


touch ./src/stories/pages/home.stories.js
echo "import Home from '../../pages/index';

export default {
  title: 'pages/Home',
  component: Home,
};

export const HomePage = () => <Home />;
" >> ./src/stories/pages/home.stories.js

cd ..
