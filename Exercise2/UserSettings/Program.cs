using System;

public class UserSettings
{
    public static bool IsFeatureEnabled(string settings, int index)
    {
        if (settings.Length != 8 || index < 1 || index > 8)
        {
            throw new ArgumentException("Invalid settings or settings index");
        }

        if (settings[index - 1] == '1')
            return true;
        else return false;
    }

    public static void Main()
    {
        //Test settings
        string userSettings = "00000000";
        int index = 7;

        bool isFeatureEnabled = IsFeatureEnabled(userSettings, index);
        Console.WriteLine(isFeatureEnabled);

        userSettings = "00000010";
        index = 7;

        isFeatureEnabled = IsFeatureEnabled(userSettings, index);
        Console.WriteLine(isFeatureEnabled);

        userSettings = "11111111";
        index = 4;

        isFeatureEnabled = IsFeatureEnabled(userSettings, index);
        Console.WriteLine(isFeatureEnabled);

    }
}