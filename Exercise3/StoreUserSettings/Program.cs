using System;
using System.IO;
public class StoreUserSettings
{
    private const string filePath = "D:\\My Projects\\First Core Exercise\\ShareSource\\ZapExercise\\Exercise3\\StoreUserSettings\\UserSettings.bin";


    // Function to save settings as a single byte
    public static void SaveSettings(bool[] settings)
    {
        if (settings.Length != 8)
            throw new ArgumentException("Settings array must contain exactly 8 boolean values.");

        byte settingsByte = 0;

        for (int i = 0; i < settings.Length; i++)
        {
            if (settings[i])
            {
                settingsByte |= (byte)(1 << i); // Set the corresponding bit
            }
        }

        File.WriteAllBytes(filePath, new byte[] { settingsByte });
    }

    // Function to load settings from a single byte
    public static bool[] LoadSettings()
    {
        if (!File.Exists(filePath))
            throw new FileNotFoundException("Settings file not found.");

        byte settingsByte = File.ReadAllBytes(filePath)[0];
        bool[] settings = new bool[8];

        for (int i = 0; i < 8; i++)
        {
            settings[i] = (settingsByte & (1 << i)) != 0; // Check if the bit is set
        }

        return settings;
    }
    public static void Main()
    {
        //Test to Save Settings to file
        //Uncomment to toggle test 

        //bool[] settings = new bool[] { false, false, false, false, false, false, false, true }; 
        //SaveSettings(settings);

        //Test to load settings from file
        //Uncomment to toggle test
        bool[] settingsLoaded = new bool[8];

        settingsLoaded = LoadSettings();

        for (int i = 0; i < settingsLoaded.Length; i++)
        {
            Console.WriteLine($"Setting {i}: {settingsLoaded[i]}");
        }

        
    }
}