+++
title = 'Claude Tips'
date = 2026-03-28T09:03:40-04:00
description = ''
+++

## .claude > TODO.md t
```
# project-name TODO

## In Progress (from git status)
- [ ] Commit widget implementation changes
    - [ ] folder/file
    - [ ] folder/new-file (new)
    - [ ] folder.new-file2 (new)
- [ ] Commit Live Activityand entitlements updates

## Build & Validation Commands
**IMPORTANT: After every code change, validate the build succeeds.**
```bash
# Build for xxx

# Quick error check

# Install on xxx

# Open in IDE
```

## Architecture

```
Second Brain concept:
Code base will grow to have these small domain like md files or some form of like Vectorized Memory that AI can use very quickly. So it doesn't have to parse the entire codebase every single time. It's essentially just a small compaction of context that is really available at all times for Claude code to use.  

Custom Workflows concept:
Once we have this like second brain and this real context that we have. A skill of Claude code is basically a saved workflow, a set of steps, and all of it is actually written by Claude itself. It's actually just a giant prompt in the MD file, but it's written in a way that Claude knows how to execute those steps every single time consistently.  
e.x. Every time I ship something, I need to write the same kind of post to let the people know that I had shipped something, what changed, how to test it, what to watch out for, how to get feedback. It's basically the same structure every single time. And to build this skill so that you don't have to ever manually write this again. You just actually do these steps manually with Claude just once, step by step. And then all you say is "Turn this into a skill I can reuse" . And now whenever we need to post something, as long as we have been working on the second brain for after every like work session. We can just trigger this skill and instantly. Claude will write into style we wanna to without reexplaining, reinfecting doing anything about like dragging and dropping. We just prompt it and we just have the content that we need to post. 
- Context is king. Context is best served fresh and condensed. 
- Let Claude code to manage context on our behalf.
- SEV investigation is a big part of our job

## Prompt
Update the project notes with what we worked on
Give me the latest status report
Split this PR into logical chunks
Turn this into a skill I can reuse
Tell me a good way to plan a live activity for when I background the app
This is a cool picture of the Clock Home mascot. Do something with it. 
Add this to my rules.
Hey, can you update that rule for me so we never do it again?
Use my Xcode MCP to build the app.
Audit my codebase and make sure that we're removing all of the audio playback and references to the audio of part of the xxx app. 
Save this to my local CLAUD.md in my project directory. Save the work that we just did. 
Load my context from my local projects. (Once we have second brain concept, we can say a command like this)
After every code change, validate the build succeeds.
Add debug logs, and run the app, and then control the emulator. (Then do the action we are trying to do). Read the logs, and debug that way. (Or we can use perfetto, hook into perfecto mcps, do a run, then have it read the traces and then see if it can find junk just like the timings. ) (For web, we could do like puppeteer and have claude navigate it using a /chrome command and then just actually do the navigation or have it write just test or have like integration end to end test.)
(To build a skill) Go and fetch hacker news for latest iOS news. 
	And then save a summary to my local claude directory
	Save what we just did into a new skill called "Fetch Hacker News."
		Why don't you extend this fetch Hacker News to fetch Twitter for Apple News? Find me a good Sigma MCP.
	Why don't you just install this for me? Spawn an iOS architecture agent, sub-agent, and do some investigation on my codebase and see if it's actually good or not.
Use what we just did to create an iOS architecture sub-agent.
Start working on my live activities feature.
All right, let's test out this iOS architecture and then just spawn a sub-agent.
Change the notification to ring a little sound when you finish execution.


```md
# TODO.md 

## Current Tasks
- Commit widget implementation changes (new files)
- Commit Live Activity and entitlements updates
- Commit music files deletions (~70 mp3s removed)
- Commit Models.swift and TimerViews.swift changes
- Decide on untracked config files (.claude/, .mcp.json, CLAUDE.md, downloads/)
- Validate build after all changes

## Settings
- Project: ark-tree
- Scheme: ark-tree
- Device: rocket

## Available Commands
- /build - Build for rocket
- /install - Install on rocket
- / audit - Run codebase audit
- /implement-feature - PRD-driven implementation

## Skills/Agents
- Live Activity expert
- Widget expert
- iOS architect
- SwiftUI specialist
- Swift reviewer
```

## Tips
1. /init, 300 lines in CLAUD.md
2. /memory
3. Shift + tab (plan mode with new feature )
4. Escape + up/ give me something else
5. Double click Escape, then restore that context point 
6. /help
7. /clear, to clear the context. Create new tab will bring up a new context as well. It's good to start with a new feature and have completely done with the old task. 
8. /context
9. /compact, to save some version of context into local second brain. 
10. /model
11. /resume , recover the context
12. /mcp
13. Use templates for git
14. /rewind, to restore the code and the conversion(git is better than this)

## CLAUD.md
1. Priority from top to bottom
2. Manually update rules: "Never do X" or "Always do Y." Document mistakes here. Add to it whenever Claude makes a mistake you don't want repeated. 
3. Ask Claude to update rules: Say "add this to my rules" and Claude updates the file. Our CLAUDE.md becomes how we actually work.
4. Use workflow triggers: When user says deploy, run deploy script. This turns Claude into a workflow engine. 
5. Compound Engineering: Commit CLAUDE.md to git: Teams gets instant access. They contribute back. Shared knowledge. Need to get rid of anything like generic for our code like file path and things like that. And we also want to be mindful how large this file becomes. 
6. `claude --dangerously-skip-permissions` Dangerously-skip for throwaway eves: Docker container. Unpunished branch. If we can blow it away, let Claude run free. 
7. /permissions

## Daily workflow
1. Start features in Plan Mode: Shift + Tab twice. Claude can read but can't execute. Explores without risk. Iterating with claude code. Arguing with it. Having a conversation with it. Really treating it like another just good engineer that I'm like working with and I never just like purely accept the first answers that it gives to me. I always kind of challenging it and I spent a lot of time and put a lot of effort at this stage of the development. Because I feel like once cloud code builds up that context and have a good execution specs, the generation of the code is actually the easy part. I love being in the zone and writing code. At least I used to. The thing is it's really hard to get back into that mode. It's like very different levels of abstractions of the way we're working. (I gave the command and I go to the next one. I am building the context. I give it a command and I go to the other one. And then I give a command. So I end up like still can get into the zone, but it's like a different style.)
2. Fresh context beats bloated. Less is more. When the context is full of dead ends, start a new session. 
3. Persist before ending session. Sessions are temporary. CLAUD.md is permanent. This is long-term memory. "Save this to my local CLAUD.md in my project directory. Save the work that we just did."
4. Lazy load context. Index at root pointing to subdirectory docs. Claude loads detail only when needed. "Load my context from my local projects. (Once we have second brain concept, we can say a command like this)"
5. Give verification commands. Test, lint, type check commands in CLAUDE.md. This 2-3x's output quality. 
6. Read thinking blocks. "I assume..." Or "I'm not sure..." = course-correct before Claude commits to wrong path. 

## Power User
Composability Framework
1. Four composability primitives. Skills, Commands, MCPs, Subagents. How they work together separates casuals from power users.
2. Skills = recurring workflows. Templates that load context when triggered. Lazy-loaded. Don't eat tokens until needed. 
3. Never create commands manually. "Create a command that does X." Let Claude manage the file structure.
4. MCPs = external service docs. Not just API connections. Structured documentation for database, browsers, systems. "Find me a good Sigma MCP"
5. Subagents = isolated context. `Task()` spawns clones for parallel work, but also it's to protect our context window. Each gets fresh context window. "Spawn an iOS architecture agent, sub-agent, and do some investigation on my codebase and see if it's actually good or not.", "Use what we just did to create an iOS architecture sub-agent."
6. Avoid instruction overload. Context is best served fresh and condensed. Quality over quantity. 
## Advanced
1. Run multiple instances. 
2. Enable notifications. Custom sound when Claude finishes. Context-switch while Claude works. "Change the notification to ring a little sound when you finish execution."
3. Git corktree for isolation. Multiple Claude instances, same repo, isolated files. Each corktree = Separate checkout.
4. /chrome connects browser. See and interact with web pages. Authenticated session. No API keys.
5. Powerful for debugging. Navigate, click, fill forms, read console. "Fix the error in console." One flow.

## Hooks & Automation
1. /hooks.  Hooks intercept actions. PreToolUse = before. PostToolUse = after.
2. Auto-format with PostToolUse. Format after edits. Catches CI edge cases. Never commit ugly code.
3. Block dangerous commands. PreToolUse blocks before execution. Guardrails for destructive ops.
4. Explore the plugin ecosystem. Pre-built skills, commands, hooks. Install and use immediately. GitHub: Claude-plugins-official
