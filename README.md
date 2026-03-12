# KassonLabMicroscopyTools (KLMT)
up-to-date version a semi-automated workflow for use in analyzing microscopy data produced in the Kasson Lab

Requirements for work flow & processing imaging data:
  - Fiji (Fiji is preferred as this supports additional plugins that will not be available in ImageJ)
  - Python3 (>= 3.6.0, <= 3.10.0)
  - See below for details on these components...

Fiji Instructions:
  - Download for respective OS here: https://imagej.net/software/fiji/?Downloads and follow instructions for installation
  - Ideally place somewhere in UserProfile | user directory (either C:\Users\USERPROFILE\ on Windows or ~/user/ directory on Linux or /Applications/ on macOS)
  - Run the program, allow any updates & exit

Python Instructions:
  - Download Python3 for respective OS here: https://www.python.org/downloads/ and install

***

INSTALLATION (automated)

- Download the KLMT directory and place it somewhere accessible.
- For WINDOWS (make sure Fiji is somewhere on the same drive!):
    - Navigate to: ".\KassonLabMicroscopyTools\bin\win\" & run install.bat
    - Go through the prompt messages & installation with Fiji &/or Python3 if you don't have them yet.
- For Linux (terminal commands delineated as $ ... ):
    - Navigate to: "./KassonLabMicroscopyTools/bin/linux/" & open a terminal instance in this path
    - under construction
- For macOS (terminal commands delineated as $ ... ):
    - pass
    - oof, we shall see if I ever get to this...

INSTALLATION (manual)

- Download the KLMT directory and place it somewhere accessible.
- Get Fiji!
- Get Python3!
- Copy the subdirectory "./KassonLabMicroscopyTools/KassonLab_MicroscopyPlugin/" to the "./Fiji.app/plugins/" subdirectory
- For python, pip-install "trace-reviewer" either in a venv or system-wide

***

WORKFLOW - QUICK GUIDE - [see UserGuide for more details]

- Fix any translational drift in the videos with F4DR (Fast4DReg) plugin for Fiji: https://imagej.net/plugins/fast4dreg
- Create an empty directory. This will be the parent analysis directory where everything gets dumped into.
- You can open your videos one at a time & run Sneak Peek (in Fiji, open and navigate to Plugins/KassonLab MicroscopyPlugin/Sneak Peek)
  - This will give you an idea of what to expect for each video segmentation, you can save the parameters in a text file to input later
- In Fiji, run Plugins/KassonLab MicroscopyPlugin/Kasson Tool
- Go through the prompts & the first directory dialog box will ask for the analysis directory (the one created at the beginning of this)
- You can then add the subsequent video files, give them a nice label (alphanumeric and "-" characters only!!)
- Proceed when all videos are added & plop in the values you obtained from Sneak Peek.
  - Use startFrame = 0 for measureing binding and fusion if flowing virus
- Let it run!
  - Coffee/tea break :)
- Proceed to a terminal instance & use command: $ python -m trace_reviewer ".\path\to\parent_analysis_dir\"
- You have options here, you can run the changepoints algorithm to identify prominent changepoints in the intensity traces if you want
- Ultimately, select the number of the video that you want to review traces with
- Use "h" flag to display options (like inverting colors, arranging the figure panel, etc.)
- I usually like to have the video open in Fiji with the boxes overlayed (open the ROIs in Fiji found at
.\parent_analysis_dir\Segmentation\data_label\keptBoxes.zip) while doing this
- You can exclude particles that don't look good or that would muddy the efficiency calculation
- To mark traces for fusion, use "f" and then the trace number
    - You can zoom in on the trace & manipulate it how you see fit, then press any key and mark (either 2 or 3) the locations of 
      (binding), fuse start, and fuse end
- Save progress by "s" and you can always resume back to where you left off :)
- At the end, you can use "e" flag in the initial prompt to generate eCDFs and gamma distribution fits with parameters.
- *talk about boxification here*
 - { FIN }
