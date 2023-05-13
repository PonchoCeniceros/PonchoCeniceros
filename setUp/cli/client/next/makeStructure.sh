#!/bin/bash
appName=$1
mkdir ./$appName/src/helpers ./$appName/src/components ./$appName/src/hooks
touch ./$appName/src/helpers/.keep ./$appName/src/components/.keep ./$appName/src/hooks/.keep

rm -f ./$appName/src/pages/index.js
echo "export default function Home() {

  return (
    <div className='h-screen w-full transition-colors duration-500 bg-msol1d	md:bg-msol2d	lg:bg-msol3d xl:bg-msol4d 2xl:bg-msol5d'>
    </div>
  );
}
" >> ./$appName/src/pages/index.js
