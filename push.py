import subprocess
import os

def run_command(command, cwd=None):
    try:
        subprocess.run(command, check=True, cwd=cwd)
    except subprocess.CalledProcessError as e:
        print(f"❌ Error running command: {' '.join(command) if isinstance(command, list) else command}")
        print(f"   Error: {e}")
        exit(1)

def sync_with_main_and_update():
    try:
        # Step 1: Sync with remote origin
        print("🔄 Checking out and pulling latest from main...")
        run_command(['git', 'pull', 'origin', 'main'])

        # Step 2: Push to main repo
        print("🔄 Pushing to main repo...")
        run_command(['git', 'add', '.'])
        run_command(['git', 'commit', '-m', 'update'])
        run_command(['git', 'push'])

        # Step 3: Run Hugo to build site
        print("🏗️ Running Hugo build...")
        run_command(['hugo'])

        # Step 5: Add and commit changes in 'public' folder
        public_dir = os.path.join(os.getcwd(), 'public')
        if os.path.isdir(public_dir):
            print(f"📂 Entering 'public' folder at {public_dir}...")
            run_command(['git', 'add', '.'], cwd=public_dir)
            run_command(['git', 'commit', '-m', 'update'], cwd=public_dir)
            run_command(['git', 'push'], cwd=public_dir)
        else:
            print("❌ 'public' folder does not exist. Did Hugo build fail?")

        print("✅ Sync, build, and push complete.")
    except Exception as e:
        print(f"❌ Unexpected error: {e}")

sync_with_main_and_update()
# subprocess(['git', 'pull', 'origin', 'main'], check=True, cwd=None)
