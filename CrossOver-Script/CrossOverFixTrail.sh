#!/usr/bin/env bash

# Logga start av skriptet
echo "Starting CrossOver trial extension script..."

# Hitta CrossOver-appen i standardsökvägar
CO_PATH='/Applications/CrossOver 2.app'
CO_BIN="${CO_PATH}/Contents/MacOS/CrossOver"

# Validera att CrossOver är installerat på rätt plats
if [ ! -d "${CO_PATH}" ]; then
  echo "❌ Error: Unable to detect CrossOver installation path at ${CO_PATH}."
  echo "Please enter the correct path to your CrossOver installation:"
  read -r CO_PATH
  CO_BIN="${CO_PATH}/Contents/MacOS/CrossOver"
  
  # Dubbelkolla att den angivna sökvägen är giltig
  if [ ! -d "${CO_PATH}" ]; then
    echo "❌ Error: Path still invalid. Exiting..."
    exit 1
  fi
fi

# Kontrollera att den körbara filen existerar
if [ ! -f "${CO_BIN}" ]; then
  echo "❌ Error: CrossOver executable not found at ${CO_BIN}. Exiting..."
  exit 1
fi

echo "✅ CrossOver found at: ${CO_PATH}"
cd "${CO_PATH}/Contents/MacOS" || exit

# Definiera processnamnet för att hitta och avsluta rätt processer
PROC_NAME='CrossOver 2'

# Hämta alla process-ID (PID) för CrossOver som körs (macOS-kompatibel)
echo "🔍 Finding running CrossOver processes..."
pids=$(pgrep -f "${PROC_NAME}")
if [ -n "${pids}" ]; then
  echo "✅ Found CrossOver processes with PIDs: ${pids}"
else
  echo "⚠️ No running CrossOver processes found."
fi

# Avsluta alla CrossOver-processer om de körs
if [ -n "${pids}" ]; then
  echo "🛑 Killing CrossOver processes..."
  kill -9 ${pids} > /dev/null 2>&1
  sleep 3 # Vänta på att processerna ska avslutas helt
  echo "✅ CrossOver processes killed."
fi

# Generera RFC3339-formaterad datumtidssträng (3 timmar bakåt i tiden)
# Detta "lurar" appen att tro att testperioden startade senare
echo "🕒 Modifying trial timestamps..."
DATETIME=$(date -u -v -3H '+%Y-%m-%dT%TZ')
echo "✅ New trial date set to: ${DATETIME}"

# Ändra tidsstämplar för testperioden i CrossOver-inställningarna
# plutil används för att ändra värden i macOS property list-filer
plutil -replace FirstRunDate -date "${DATETIME}" ~/Library/Preferences/com.codeweavers.CrossOver.plist
plutil -replace SULastCheckTime -date "${DATETIME}" ~/Library/Preferences/com.codeweavers.CrossOver.plist
echo "✅ Updated trial timestamps in preferences."

# Visa macOS-notifiering om att skriptet lyckades
echo "📢 Displaying success notification..."
/usr/bin/osascript -e "display notification \"trial fixed: date changed to ${DATETIME}\""

# Återställ alla "bottles" (virtuella Windows-miljöer i CrossOver)
# Detta tar bort tidsstämplar som kan användas för att spåra testperioden
echo "🧹 Resetting CrossOver bottles..."
for file in ~/Library/Application\ Support/CrossOver/Bottles/*/.{eval,update-timestamp}; do
  if [ -f "${file}" ] || [ -d "${file}" ]; then
    rm -rf "${file}"
    echo "✅ Removed: ${file}"
  fi
done

# Ny kod: Modifiera system.reg-filen för Steam-bottle
STEAM_BOTTLE_PATH='/Users/mans/Library/Application Support/CrossOver/Bottles/Steam/system.reg'
echo "🔧 Modifying Steam bottle system.reg file..."
if [ -f "${STEAM_BOTTLE_PATH}" ]; then
  # Temporär fil för att hålla modifierade innehållet
  TMP_FILE=$(mktemp)
  
  # Läs system.reg-filen och ta bort CodeWeavers CrossOver-blocket
  awk '/\[Software\\\\\ CodeWeavers\\\\\ CrossOver/{flag=1; next} /^\[/{flag=0} !flag' "${STEAM_BOTTLE_PATH}" > "${TMP_FILE}"
  
  # Kopiera tillbaka det modifierade innehållet till originalet
  cp "${TMP_FILE}" "${STEAM_BOTTLE_PATH}"
  rm "${TMP_FILE}"
  
  echo "✅ Successfully removed CrossOver registration block from system.reg"
else
  echo "⚠️ Steam bottle system.reg not found at ${STEAM_BOTTLE_PATH}. Skipping modification."
fi

# Kontrollera om original-binärfilen existerar
# CrossOver kan ha en "origin"-version som är den ursprungliga binärfilen
ORIGIN_BIN="${PWD}/CrossOver.origin"
if [ ! -f "${ORIGIN_BIN}" ]; then
  echo "⚠️ Original CrossOver binary not found at ${ORIGIN_BIN}. Using standard binary."
  ORIGIN_BIN="${CO_BIN}"
fi

# Starta om CrossOver med rätt körbar fil
# & i slutet gör att processen startas i bakgrunden så att skriptet kan fortsätta
echo "🚀 Restarting CrossOver..."
"${ORIGIN_BIN}" >> /tmp/co_log.log 2>&1 &
echo "✅ CrossOver restarted. Logs written to /tmp/co_log.log."

# Slutligt framgångsmeddelande
echo "🎉 Script completed successfully! CrossOver trial extended and bottles fixed."